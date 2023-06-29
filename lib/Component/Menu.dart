import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentMenu extends StatelessWidget {
  const StudentMenu({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Drawer(
      surfaceTintColor: const Color(0xffeef2f7),
      width: 250,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome !",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Books",
                      style: TextStyle(fontSize: 20),
                    ),
                    Icon(
                      CupertinoIcons.book,
                      color: Colors.grey.shade500,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/StudentAccount');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Account",
                      style: TextStyle(fontSize: 20),
                    ),
                    Icon(
                      CupertinoIcons.person_crop_circle_fill_badge_exclam,
                      color: Colors.grey.shade500,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/StudentRequests');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Requests",
                      style: TextStyle(fontSize: 20),
                    ),
                    Icon(
                      CupertinoIcons.tag_fill,
                      color: Colors.grey.shade500,
                    )
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),
              MaterialButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushNamedAndRemoveUntil(context, '/Login',(Route<dynamic> route) => false,);
                },
                height: 45,
                minWidth: width * .8,
                elevation: 3,
                highlightElevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.white,
                child: Text("Log Out",
                    style:
                        TextStyle(fontSize: 17, color: Colors.grey.shade900)),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LibrarianMenu extends StatelessWidget {
  const LibrarianMenu({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Drawer(
      surfaceTintColor: const Color(0xffeef2f7),
      width: 250,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome !",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Books",
                      style: TextStyle(fontSize: 20),
                    ),
                    Icon(
                      CupertinoIcons.book,
                      color: Colors.grey.shade500,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/LibrarianAccount');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Account",
                      style: TextStyle(fontSize: 20),
                    ),
                    Icon(
                      CupertinoIcons.person_crop_circle_fill_badge_exclam,
                      color: Colors.grey.shade500,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/LibrarianAddBooks');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Add Books",
                      style: TextStyle(fontSize: 20),
                    ),
                    Icon(
                      CupertinoIcons.tag_fill,
                      color: Colors.grey.shade500,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/LibrarianAcceptRequest');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Accept Requests",
                      style: TextStyle(fontSize: 20),
                    ),
                    Icon(
                      CupertinoIcons.tag_fill,
                      color: Colors.grey.shade500,
                    )
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),
              MaterialButton(
                onPressed: ()async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, '/Login');
                },
                height: 45,
                minWidth: width * .8,
                elevation: 3,
                highlightElevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.white,
                child: Text("Log Out",
                    style:
                        TextStyle(fontSize: 17, color: Colors.grey.shade900)),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AdminMenu extends StatelessWidget {
  const AdminMenu({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Drawer(
      surfaceTintColor: const Color(0xffeef2f7),
      width: 250,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome !",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Books",
                      style: TextStyle(fontSize: 20),
                    ),
                    Icon(
                      CupertinoIcons.book,
                      color: Colors.grey.shade500,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/AdminAccount');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Account",
                      style: TextStyle(fontSize: 20),
                    ),
                    Icon(
                      CupertinoIcons.person_crop_circle_fill_badge_exclam,
                      color: Colors.grey.shade500,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/AdminManageLibrarian');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Manage Librarian",
                      style: TextStyle(fontSize: 20),
                    ),
                    Icon(
                      CupertinoIcons.tag_fill,
                      color: Colors.grey.shade500,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/AdminManageStudent');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Manage Student",
                      style: TextStyle(fontSize: 20),
                    ),
                    Icon(
                      CupertinoIcons.tag_fill,
                      color: Colors.grey.shade500,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/AdminAllUsers');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "All Users",
                      style: TextStyle(fontSize: 20),
                    ),
                    Icon(
                      CupertinoIcons.tag_fill,
                      color: Colors.grey.shade500,
                    )
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),
              MaterialButton(
                onPressed: ()async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, '/Login');
                },
                height: 45,
                minWidth: width * .8,
                elevation: 3,
                highlightElevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.white,
                child: Text("Log Out",
                    style:
                        TextStyle(fontSize: 17, color: Colors.grey.shade900)),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
