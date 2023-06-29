import 'package:bookhive/Services/getData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class LibrarianAcceptRequest extends StatefulWidget {
  const LibrarianAcceptRequest({super.key});

  @override
  State<LibrarianAcceptRequest> createState() => _LibrarianAcceptRequestState();
}

class _LibrarianAcceptRequestState extends State<LibrarianAcceptRequest> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: const Color(0xffeef2f7),
        appBar: AppBar(
          backgroundColor: const Color(0xffeef2f7),
          title: const Text("Requests"),
          centerTitle: true,
        ),
        body: LiquidPullToRefresh(
          backgroundColor: const Color(0xffeef2f7),
          springAnimationDurationInMilliseconds: 1300,
          showChildOpacityTransition: false,
          color: const Color.fromARGB(255, 216, 229, 245),
          animSpeedFactor: 2,
          onRefresh: () async {
            showDialog(
              context: context,
              builder: (context) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
            getAllRequest();
            Navigator.pop(context);
            setState(() {});
          },
          child: ListView.builder(
            itemCount: Requests.length,
            itemBuilder: (context, index) {
              var request = Requests[index];
              return Slidable(
                closeOnScroll: true,
                endActionPane: ActionPane(
                  extentRatio: .23,
                  motion: const ScrollMotion(),
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          );
                          await FirebaseFirestore.instance
                              .collection('requests')
                              .where('id', isEqualTo: Requests[index].id)
                              .get()
                              .then((value) => value.docs.first.reference
                                  .delete()
                                  .then((value) => showToast("Deleted"))
                                  .onError(
                                      (error, stackTrace) => showToast(error)));
                          getAllRequest();
                          Navigator.pop(context);
                          setState(() {});
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          height: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: const Icon(CupertinoIcons.delete),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.only(
                        left: 20, top: 15, bottom: 15, right: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                request.book,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                request.student,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            );
                            await FirebaseFirestore.instance
                                .collection('requests')
                                .doc(request.id)
                                .update({
                              'status': "accepted",
                              'date': DateTime.now()
                            });
                            getAllRequest();
                            Navigator.pop(context);

                            setState(() {});
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 6),
                            decoration: BoxDecoration(
                                color: Colors.teal.shade400,
                                borderRadius: BorderRadius.circular(7)),
                            child: const Text("Accept",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500)),
                          ),
                        )
                      ],
                    )),
              );
            },
          ),
        ));
  }
}
