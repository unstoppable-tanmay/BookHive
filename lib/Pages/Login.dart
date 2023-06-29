import 'package:bookhive/Pages/ViewBooks.dart';
import 'package:bookhive/Services/getData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Values
  String dropdownvalue = 'Student';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserCredential? user;

  @override
  void initState() {
    super.initState();
    if (FirebaseAuth.instance.currentUser != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => ViewBooks(usertype: UserType),
        ),
      );
    }
  }

  void login(context) async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
    try {
      user = await _auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      await getUserData(user!.user!.uid);
      getBooks();
      if (UserType == 'student') {
        getRequest();
      } else if (UserType == 'librarian') {
        getAllRequest();
      }
      if (Userdata!=null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => ViewBooks(
                    usertype: UserType,
                  )),
          (Route<dynamic> route) => false,
        );
      }
    } catch (e) {
      Navigator.pop(context);
      showToast(e);
    }
    // setState(() {});
  }

  // password on/off
  bool eye = true;

  @override
  Widget build(BuildContext context) {
    // width of full widget
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xffeef2f7),
      body: Center(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/locks.gif",
                    color: const Color(0xffeef2f7),
                    colorBlendMode: BlendMode.darken,
                    fit: BoxFit.fitWidth,
                    height: 150,
                    width: width * 0.8),
                const Text(
                  "Welcome Again !",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
                ),
                Text("Have a Visit to the Hive of Books",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600)),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  cursorColor: Colors.black,
                  controller: emailController,
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.grey.shade700),
                    icon: const Icon(CupertinoIcons.at),
                    border: const UnderlineInputBorder(),
                    labelText: 'Enter your Email',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  cursorColor: Colors.black,
                  controller: passwordController,
                  obscureText: eye,
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.grey.shade700),
                    icon: InkWell(
                        onTap: () {
                          eye = !eye;
                          setState(() {});
                        },
                        child: Icon(eye
                            ? CupertinoIcons.eye_slash
                            : CupertinoIcons.eye)),
                    border: const UnderlineInputBorder(),
                    labelText: 'Enter your Password',
                  ),
                ),
                const SizedBox(
                  height: 55,
                ),
                MaterialButton(
                  height: 45,
                  minWidth: width * .8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  color: Colors.teal.shade600,
                  onPressed: () {
                    login(context);
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 18, color: Colors.grey.shade200),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/ForgotPassword');
                    },
                    child: const Text("Forgot Password"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
