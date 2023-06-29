import 'package:flutter/material.dart';

NoInternet(){
  return Dialog(
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
                  fontSize: 21,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
}