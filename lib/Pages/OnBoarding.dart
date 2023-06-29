import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {

  @override
  Widget build(BuildContext context) {
    // width of full widget
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;

    // controlling ther page
    PageController pageController = PageController();

    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: const Color(0xffeef2f7),
        body: PageView(
          physics: const BouncingScrollPhysics(),
          controller: pageController,
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Transform.translate(
                  offset: const Offset(0, 20),
                  child: Transform.scale(
                      scale: 1.3,
                      child: Image.asset(
                        "assets/images/study.gif",
                        color: const Color(0xffeef2f7),
                        colorBlendMode: BlendMode.darken,
                      ))),
              const SizedBox(
                height: 100,
              ),
              const Text(
                "A Book Hive",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: width * .75,
                child: const Text(
                  "A Library Where you can find your All Course Books and Some Passionate Extra Books and things for study . . .",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () {
                  pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
                padding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 25),
                autofocus: true,
                elevation: 0,
                color: Colors.teal.shade700,
                shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1.5, color: Colors.white),
                    borderRadius: BorderRadius.circular(22.0)),
                child: const Text(
                  "Next Page",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              )
            ]),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              ClipRect(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Transform.scale(
                  scale: 1.5,
                  child: Image.asset(
                    "assets/images/gif2.gif",
                    color: const Color(0xffeef2f7),
                    colorBlendMode: BlendMode.darken,
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              const Text(
                "Online Services",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: width * .75,
                child: const Text(
                  "There is a lot of work done online for more easy access of Books, now you can request for books and extend the leage time . . .",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () {
                  pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
                padding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 25),
                autofocus: true,
                elevation: 5,
                color: Colors.teal.shade700,
                shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1.5, color: Colors.white),
                    borderRadius: BorderRadius.circular(22.0)),
                child: const Text(
                  "Next Page",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              )
            ]),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                "assets/images/management.gif",
                color: const Color(0xffeef2f7),
                colorBlendMode: BlendMode.darken,
              ),
              const SizedBox(
                height: 100,
              ),
              const Text(
                "Management Team",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: width * .75,
                child: const Text(
                  "Here Admin can manage update delete or add books to the store and can accept the requests from the students etc . . .",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Login');
                },
                padding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 25),
                autofocus: true,
                elevation: 0,
                color: Colors.teal.shade700,
                shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1.5, color: Colors.white),
                    borderRadius: BorderRadius.circular(22.0)),
                child: const Text(
                  "Let's Login",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              )
            ]),
          ],
        ));
  }
}
