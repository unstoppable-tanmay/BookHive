import 'package:flutter/material.dart';

class Pages extends StatelessWidget {
  const Pages({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("All Pages"),
        centerTitle: true,
      ),
      body: SizedBox(
        width: width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/NoInternet');
                },
                height: 45,
                minWidth: width * .8,
                elevation: 0,
                highlightElevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                color: Colors.teal.shade600,
                child: const Text("No Internet",
                    style: TextStyle(fontSize: 17, color: Colors.white)),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/OnBoarding');
                },
                height: 45,
                minWidth: width * .8,
                elevation: 0,
                highlightElevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                color: Colors.teal.shade600,
                child: const Text("On Boarding",
                    style: TextStyle(fontSize: 17, color: Colors.white)),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Login');
                },
                height: 45,
                minWidth: width * .8,
                elevation: 0,
                highlightElevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                color: Colors.teal.shade600,
                child: const Text("Login",
                    style: TextStyle(fontSize: 17, color: Colors.white)),
              ),
              const SizedBox(
                height: 20,
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
                    borderRadius: BorderRadius.circular(100)),
                color: Colors.teal.shade600,
                child: const Text("Forgot Password",
                    style: TextStyle(fontSize: 17, color: Colors.white)),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/ViewBooks');
                },
                height: 45,
                minWidth: width * .8,
                elevation: 0,
                highlightElevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                color: Colors.teal.shade600,
                child: const Text("View Books",
                    style: TextStyle(fontSize: 17, color: Colors.white)),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/StudentAccount');
                },
                height: 45,
                minWidth: width * .8,
                elevation: 0,
                highlightElevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                color: Colors.teal.shade600,
                child: const Text("Student Account",
                    style: TextStyle(fontSize: 17, color: Colors.white)),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/StudentRequests');
                },
                height: 45,
                minWidth: width * .8,
                elevation: 0,
                highlightElevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                color: Colors.teal.shade600,
                child: const Text("Student Request",
                    style: TextStyle(fontSize: 17, color: Colors.white)),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/LibrarianAccount');
                },
                height: 45,
                minWidth: width * .8,
                elevation: 0,
                highlightElevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                color: Colors.teal.shade600,
                child: const Text("Librarian Account",
                    style: TextStyle(fontSize: 17, color: Colors.white)),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/LibrarianAddBooks');
                },
                height: 45,
                minWidth: width * .8,
                elevation: 0,
                highlightElevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                color: Colors.teal.shade600,
                child: const Text("Librarian Add Books",
                    style: TextStyle(fontSize: 17, color: Colors.white)),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/LibrarianAcceptRequest');
                },
                height: 45,
                minWidth: width * .8,
                elevation: 0,
                highlightElevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                color: Colors.teal.shade600,
                child: const Text("Librarian Accept Request",
                    style: TextStyle(fontSize: 17, color: Colors.white)),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/AdminAccount');
                },
                height: 45,
                minWidth: width * .8,
                elevation: 0,
                highlightElevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                color: Colors.teal.shade600,
                child: const Text("Admin Account",
                    style: TextStyle(fontSize: 17, color: Colors.white)),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/AdminManageLibrarian');
                },
                height: 45,
                minWidth: width * .8,
                elevation: 0,
                highlightElevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                color: Colors.teal.shade600,
                child: const Text("Admin Manage Librarian",
                    style: TextStyle(fontSize: 17, color: Colors.white)),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/AdminManageStudent');
                },
                height: 45,
                minWidth: width * .8,
                elevation: 0,
                highlightElevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                color: Colors.teal.shade600,
                child: const Text("Admin Manage Student",
                    style: TextStyle(fontSize: 17, color: Colors.white)),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
