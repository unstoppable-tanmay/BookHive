import 'package:bookhive/Services/getData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminAccount extends StatelessWidget {
  const AdminAccount({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xffeef2f7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Account",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: width,
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 80,
              foregroundImage: AssetImage("assets/images/admin.webp"),
            ),
            const SizedBox(height: 20),
            Text(Userdata!.name,
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey.shade900,
                    fontWeight: FontWeight.w600)),
            Text(Userdata!.email,
                style: TextStyle(fontSize: 17, color: Colors.grey.shade500)),
            const SizedBox(height: 50),
            MaterialButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: ((context) {
                      return SimpleDialog(children: [
                        Container(
                          width: 400,
                          height: 300,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Column(
                            children: [
                              Text("Name : ${Userdata!.name}",
                                  style: const TextStyle(
                                      fontSize: 25,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500)),
                              const SizedBox(
                                height: 15,
                              ),
                              Text('Email : ${Userdata!.email}',
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.black)),
                              const SizedBox(
                                height: 7,
                              ),
                              Text('Branch : ${Userdata!.branch}',
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.black)),
                              const SizedBox(
                                height: 7,
                              ),
                              Text('Id : ${Userdata!.id}',
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.black)),
                              const Expanded(child: SizedBox()),
                              Text(
                                  'If Any Information if wrong then inform to Developer',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade500)),
                              const SizedBox(
                                height: 7,
                              ),
                              MaterialButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                height: 45,
                                minWidth: width * .8,
                                elevation: 0,
                                highlightElevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                color: Colors.white,
                                child: Text("Back",
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.grey.shade900)),
                              ),
                            ],
                          ),
                        ),
                      ]);
                    }));
              },
              height: 45,
              minWidth: width * .8,
              elevation: 0,
              highlightElevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.white,
              child: Text("All Details",
                  style: TextStyle(fontSize: 17, color: Colors.grey.shade900)),
            ),
            const SizedBox(
              height: 15,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ForgotPassword');
              },
              height: 45,
              minWidth: width * .8,
              elevation: 0,
              highlightElevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.white,
              child: Text("Forgot Password",
                  style: TextStyle(fontSize: 17, color: Colors.grey.shade900)),
            ),
            const SizedBox(
              height: 15,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, '/AdminManageLibrarian');},
              height: 45,
              minWidth: width * .8,
              elevation: 0,
              highlightElevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.white,
              child: Text("Manage Librarian",
                  style: TextStyle(fontSize: 17, color: Colors.grey.shade900)),
            ),
            const SizedBox(
              height: 15,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, '/AdminManageStudent');},
              height: 45,
              minWidth: width * .8,
              elevation: 0,
              highlightElevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.white,
              child: Text("Manage Student",
                  style: TextStyle(fontSize: 17, color: Colors.grey.shade900)),
            ),
            const Expanded(child: SizedBox()),
            MaterialButton(
              onPressed: () {},
              height: 45,
              minWidth: width * .8,
              elevation: 0,
              highlightElevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              color: Colors.teal.shade600,
              child: const Text("View Reviews",
                  style: TextStyle(fontSize: 17, color: Colors.white)),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
