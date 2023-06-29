import 'package:bookhive/Services/getData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class AdminAllUsers extends StatefulWidget {
  const AdminAllUsers({super.key});

  @override
  State<AdminAllUsers> createState() => _AdminAllUsersState();
}

class _AdminAllUsersState extends State<AdminAllUsers> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: const Color(0xffeef2f7),
        appBar: AppBar(
          backgroundColor: const Color(0xffeef2f7),
          title: const Text("All Users"),
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
            getUsers();
            Navigator.pop(context);
            setState(() {});
          },
          child: ListView.builder(
            itemCount: Users.length,
            itemBuilder: (context, index) {
              var request = Users[index];
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
                                request.name,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                request.role,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        const Text("Manage",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500))
                      ],
                    )),
              );
            },
          ),
        ));
  }
}
