import 'dart:io';

import 'package:bookhive/Services/getData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class LibrarianAddBooks extends StatefulWidget {
  const LibrarianAddBooks({super.key});

  @override
  State<LibrarianAddBooks> createState() => _LibrarianAddBooksState();
}

class _LibrarianAddBooksState extends State<LibrarianAddBooks> {
  File? imagepath;

  void PickImage() async {
    ImagePicker picker = ImagePicker();
    var image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imagepath = File(image!.path);
    });
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController ratingController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController pagesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffeef2f7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Add Books",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: SizedBox(
            height: height * .87,
            width: width*.86,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Stack(
                  children: [
                    imagepath != null
                        ? Container(
                            width: 120,
                            height: 170,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Colors.white),
                            child: Image.file(
                              File(imagepath!.path),
                              fit: BoxFit.fill,
                            ))
                        : const SizedBox(),
                    InkWell(
                        onTap: () {
                          PickImage();
                        },
                        child: Container(
                          width: 120,
                          height: 170,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.black26),
                          child: const Icon(CupertinoIcons.add, size: 40),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: nameController,
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter Book Name',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: authorController,
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter Author Name',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: imageController,
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter Image Link',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: ratingController,
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter Rating',
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: TextFormField(
                        controller: colorController,
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter Color',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: sizeController,
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter Size',
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: TextFormField(
                        controller: pagesController,
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter Pages',
                        ),
                      ),
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
                const Text("you can later edit this book"),
                const SizedBox(height: 10),
                MaterialButton(
                  onPressed: () async {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    );
                    if (nameController.text != '' &&
                        authorController.text != '' &&
                        imageController.text != '' &&
                        ratingController.text != '' &&
                        colorController.text != '' &&
                        sizeController.text != '' &&
                        pagesController.text != '') {
                      var uuid = const Uuid();
                      var id = uuid.v4();
                      await FirebaseFirestore.instance
                          .collection('books')
                          .doc(id)
                          .set({
                            'name': nameController.text,
                            'author': authorController.text,
                            'image': imageController.text,
                            'color': colorController.text,
                            'star': ratingController.text,
                            'size': sizeController.text,
                            'pages': pagesController.text,
                            'id': id,
                          })
                          .then((value) => showToast("Created"))
                          .onError((error, stackTrace) => showToast(error));
                    } else {
                      showToast("Enter All The Field");
                    }
                    Navigator.pop(context);
                  },
                  height: 45,
                  minWidth: width * .8,
                  elevation: 0,
                  highlightElevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.black26,
                  child: Text("Add",
                      style: TextStyle(fontSize: 17, color: Colors.grey.shade900)),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
