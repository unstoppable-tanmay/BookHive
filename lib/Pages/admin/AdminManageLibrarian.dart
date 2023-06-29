import 'package:flutter/material.dart';

class AdminManageLibrarian extends StatelessWidget {
  const AdminManageLibrarian({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeef2f7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Manage Librarian",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Uh Oh!",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500)),
            Transform.scale(
                scale: .7,
                child: Image.asset(
                  "assets/images/development.gif",
                  color: Color(0xffeef2f7),
                  colorBlendMode: BlendMode.darken,
                )),
            SizedBox(
              height: 20,
            ),
            Text("Sorry, For Now The Librarians \nAre Hardcoded...",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade600)),
          ],
        ),
      ),
    );
  }
}
