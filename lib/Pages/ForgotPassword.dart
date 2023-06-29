import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  int state = 0;
  // password on/off
  bool eye = true;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffeef2f7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Reset Password",
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Transform.scale(
              scale: 1.35,
              child: Image.asset(
                "assets/images/password.gif",
                height: height * .3,
                width: width,
                color: const Color(0xffeef2f7),
                colorBlendMode: BlendMode.darken,
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            state == 0
                ? TextFormField(
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
                  )
                : state == 2
                    ? TextFormField(
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
                      )
                    : SizedBox(
                        height: 0,
                      ),
            if (state == 2)
              const SizedBox(
                height: 25,
              ),
            state == 1
                ? TextFormField(
                    cursorColor: Colors.black,
                    controller: otpController,
                    onTapOutside: (event) {
                      FocusScope.of(context).unfocus();
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.grey.shade700),
                      icon: const Icon(CupertinoIcons.timer),
                      border: const UnderlineInputBorder(),
                      labelText: 'Enter your OTP',
                    ),
                  )
                : state == 2
                    ? TextFormField(
                        cursorColor: Colors.black,
                        controller: confirmpasswordController,
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
                          labelText: 'Confirm your Password',
                        ),
                      )
                    : SizedBox(),
            const SizedBox(
              height: 50,
            ),
            MaterialButton(
              height: 45,
              minWidth: width * .8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              color: Colors.teal.shade600,
              onPressed: () {
                state < 2 ? state++ : state = 0;
                setState(() {});
              },
              child: Text(
                state == 0
                    ? "Get OTP"
                    : state == 1
                        ? "Validate OTP"
                        : state == 2
                            ? "Confirm"
                            : "Back To Home",
                style: TextStyle(fontSize: 18, color: Colors.grey.shade200),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ]),
        ),
      ),
    );
  }
}
