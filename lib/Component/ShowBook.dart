import 'package:bookhive/Pages/librarian/LibrarianEditBooks.dart';
import 'package:bookhive/Services/getData.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'Star.dart';

ShowDialog(width, context, BookData ele) {
  var uuid = const Uuid();

  showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        surfaceTintColor: const Color(0xffeef2f7),
        contentPadding: const EdgeInsets.all(10),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(9))),
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            width: width * .7,
            // height: 490,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: width * .5,
                  height: 280,
                  clipBehavior: Clip.hardEdge,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  child: CachedNetworkImage(
                    imageUrl: ele.image,
                    fit: BoxFit.fill,
                    placeholderFadeInDuration:
                        const Duration(milliseconds: 100),
                    placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(
                      color: Colors.white,
                    )),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  ele.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                  maxLines: 2,
                ),
                Text(ele.author,
                  textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54)),
                const SizedBox(
                  height: 10,
                ),
                Star(count: int.parse(ele.star), color: true),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 150,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${ele.size} MB",
                        style:
                            const TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "${ele.pages} Pages",
                        style:
                            const TextStyle(fontSize: 15, color: Colors.black),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                if (UserType == 'student')
                  MaterialButton(
                    onPressed: () {
                      var id = uuid.v4();
                      FirebaseFirestore.instance
                          .collection('requests')
                          .doc(id)
                          .set({
                        'id': id,
                        'book': ele.name,
                        'date': DateTime.now(),
                        'status': "requested",
                        'uid': Uid,
                        'student': "${Userdata!.name} - ${Userdata!.branch}"
                      }).then((value) {
                        showToast("Requested");
                        Navigator.pop(context);
                      }).onError((error, stackTrace) {
                        showToast(error.toString());
                        Navigator.pop(context);
                      });
                      getRequest();
                    },
                    padding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 25),
                    autofocus: true,
                    elevation: 0,
                    color: Colors.teal.shade700,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(39.0)),
                    child: const Text(
                      "Request Book",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  )
                else if (UserType == 'librarian')
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return LibrarianEditBooks(Book: ele);
                            },
                          ));
                        },
                        padding: const EdgeInsets.symmetric(
                            vertical: 7, horizontal: 25),
                        autofocus: true,
                        elevation: 4,
                        color: Colors.grey.shade500,
                        shape: RoundedRectangleBorder(
                            side:
                                const BorderSide(width: 1, color: Colors.white),
                            borderRadius: BorderRadius.circular(39.0)),
                        child: const Text(
                          "Edit",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Delete ${ele.name}"),
                                content: const Text(
                                    "If Deleted then Permanently deleted data can not be recovered"),
                                actions: [
                                  MaterialButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 7, horizontal: 25),
                                    autofocus: true,
                                    elevation: 4,
                                    color: Colors.grey.shade400,
                                    shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            width: 1, color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(39.0)),
                                    child: const Text(
                                      "Cancel",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  ),
                                  MaterialButton(
                                    onPressed: () async {
                                      try {
                                        await FirebaseFirestore.instance
                                            .collection('books')
                                            .doc(ele.id)
                                            .delete()
                                            .then(
                                                (value) => showToast("Deleted"))
                                            .onError((error, stackTrace) =>
                                                showToast(error));
                                      } catch (e) {
                                        showToast(e);
                                      }
                                    },
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 7, horizontal: 25),
                                    autofocus: true,
                                    elevation: 4,
                                    color: Colors.orange.shade200,
                                    shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            width: 1, color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(39.0)),
                                    child: const Text(
                                      "Delete",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        padding: const EdgeInsets.symmetric(
                            vertical: 7, horizontal: 25),
                        autofocus: true,
                        elevation: 4,
                        color: Colors.orangeAccent.shade200,
                        shape: RoundedRectangleBorder(
                            side:
                                const BorderSide(width: 1, color: Colors.white),
                            borderRadius: BorderRadius.circular(39.0)),
                        child: const Text(
                          "Delete",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ],
                  )
              ],
            ),
          )
        ],
      );
    },
  );
}
