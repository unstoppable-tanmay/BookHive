import 'package:flutter/material.dart';

NoInternet() {
  return Dialog.fullscreen(
    backgroundColor: const Color(0xffc3c9ff),
    // extendBodyBehindAppBar: true,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/nointernet.gif",
            height: 250,
            fit: BoxFit.fitHeight,
            scale: .6,
          ),
          const Text(
            "Uh Oh! There Is No Internet",
            style: TextStyle(
                fontSize: 21, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          // const SizedBox(height: 40,),
          // MaterialButton(
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          //   height: 45,
          //   minWidth: width * .6,
          //   elevation: 0,
          //   highlightElevation: 0,
          //   shape:
          //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          //   color: Colors.white,
          //   child: Text("Reload",
          //       style: TextStyle(fontSize: 17, color: Colors.grey.shade900)),
          // ),
        ],
      ),
    ),
  );
}
