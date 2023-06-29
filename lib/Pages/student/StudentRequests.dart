import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../Services/getData.dart';

class StudentRequest extends StatefulWidget {
  const StudentRequest({super.key});

  @override
  State<StudentRequest> createState() => _StudentRequestState();
}

class _StudentRequestState extends State<StudentRequest> {
  @override
  void initState() {
    super.initState();
    if (UserType != 'student') Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color(0xffeef2f7),
        appBar: AppBar(
          backgroundColor: const Color(0xffeef2f7),
          title: const Text("Books Pan"),
          centerTitle: true,
        ),
        body: LiquidPullToRefresh(
          onRefresh: () async {
            showDialog(
              context: context,
              builder: (context) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
            getRequest();
            setState(() {});
            Navigator.pop(context);
          },
          backgroundColor: const Color(0xffeef2f7),
          springAnimationDurationInMilliseconds: 1300,
          showChildOpacityTransition: false,
          color: const Color.fromARGB(255, 216, 229, 245),
          animSpeedFactor: 2,
          child: ListView.builder(
            itemCount: Requests.length,
            itemBuilder: (context, index) {
              var isExpiring = Requests[index]
                      .date
                      .add(const Duration(days: 5))
                      .isAfter(DateTime.now()) &&
                  Requests[index]
                      .date
                      .add(const Duration(days: 5))
                      .isBefore(DateTime.now());

              if (Requests[index].date.isAfter(DateTime.now())) {
                FirebaseFirestore.instance
                    .collection('requests')
                    .doc(Requests[index].id)
                    .get()
                    .then((value) => value.reference
                            .delete()
                            .then((value) {})
                            .onError((error, stackTrace) {
                          showToast(error);
                        }));

                setState(() {
                  getRequest();
                });
              }

              return Slidable(
                closeOnScroll: true,
                endActionPane: ActionPane(
                  extentRatio: isExpiring ? .4 : .23,
                  motion: const ScrollMotion(),
                  children: [
                    isExpiring
                        ? Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              height: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(7)),
                              child: const Icon(CupertinoIcons.time),
                            ),
                          )
                        : const SizedBox(),
                    isExpiring
                        ? const SizedBox(
                            width: 10,
                          )
                        : const SizedBox(),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          );
                          FirebaseFirestore.instance
                              .collection('requests')
                              .doc(Requests[index].id)
                              .get()
                              .then((value) =>
                                  value.reference.delete().then((value) {
                                    setState(() {
                                      getRequest();
                                    });
                                    Navigator.pop(context);
                                  }).onError((error, stackTrace) {
                                    showToast(error);
                                  }));
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
                      color: Requests[index].status == 'requested'
                          ? Colors.white
                          : Requests[index].status == 'accepted'
                              ? Colors.green.shade100
                              : isExpiring
                                  ? Colors.orange.shade100
                                  : Colors.white,
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
                                Requests[index].book,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                Requests[index]
                                    .date
                                    .toString()
                                    .substring(0, 10),
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        Text(
                            Requests[index].status[0].toUpperCase() +
                                Requests[index].status.substring(1),
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500))
                      ],
                    )),
              );
            },
          ),
        ));
  }
}
