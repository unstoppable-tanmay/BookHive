import 'package:bookhive/Component/Menu.dart';
import 'package:bookhive/Component/Trending.dart';
import 'package:bookhive/Services/getData.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../Component/ShowBook.dart';

class ViewBooks extends StatefulWidget {
  const ViewBooks({super.key, required this.usertype});
  final String usertype;

  @override
  State<ViewBooks> createState() => _ViewBooksState();
}

class _ViewBooksState extends State<ViewBooks> {
  @override
  Widget build(BuildContext context) {
    // width of full widget
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      endDrawer: widget.usertype == 'student'
          ? const StudentMenu()
          : widget.usertype == 'librarian'
              ? const LibrarianMenu()
              : const AdminMenu(),
      backgroundColor: const Color(0xffeef2f7),
      appBar: AppBar(
        scrolledUnderElevation: 5,
        surfaceTintColor: const Color(0xffeef2f7),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(CupertinoIcons.bars, size: 35),
              ),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
        backgroundColor: const Color(0xffeef2f7),
        title: const Text(
          "The Books",
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Books.isEmpty
          ? Align(
            alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              const Text(
                "Something Went Wrong",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () async {
                  await getBooks();
                  setState(() {});
                },
                height: 45,
                minWidth: width * .8,
                elevation: 0,
                highlightElevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.white,
                child: Text("Refresh",
                    style:
                        TextStyle(fontSize: 17, color: Colors.grey.shade900)),
              ),
            ]))
          : LiquidPullToRefresh(
              onRefresh: () async {
                getBooks();
                setState(() {});
              },
              backgroundColor: const Color(0xffeef2f7),
              springAnimationDurationInMilliseconds: 1300,
              showChildOpacityTransition: false,
              color: const Color.fromARGB(255, 216, 229, 245),
              animSpeedFactor: 2,
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 30),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0, bottom: 10),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Trending Books",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          )),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        height: height * .25,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 9),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 1300),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.25,
                      ),
                      items: Books.map((ele) {
                        return Builder(
                          builder: (BuildContext context) {
                            var localwidth = MediaQuery.of(context).size.width;
                            Color color = hexToColor(
                                ele.color); // this color could be anything
                            var textColor = color.computeLuminance() > 0.5
                                ? true // black
                                : false; // white

                            return Trending(
                              ele: ele,
                              width: width,
                              localwidth: localwidth,
                              textColor: textColor,
                            );
                          },
                        );
                      }).toList(),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "All Books",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          crossAxisSpacing: 20.0,
                          mainAxisSpacing: 30.0,
                          shrinkWrap: true,
                          childAspectRatio: .66,
                          children: Books.map((ele) {
                            return InkWell(
                              onTap: () {
                                ShowDialog(width, context, ele);
                              },
                              child: Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: Colors.grey.shade50,
                                      shape: BoxShape.rectangle,
                                      boxShadow: const [
                                        BoxShadow(
                                          offset: Offset(0, 2.13),
                                          color: Color.fromRGBO(0, 0, 0, 0.098),
                                          blurRadius: 3.205,
                                          spreadRadius: -12,
                                        ),
                                        BoxShadow(
                                          offset: Offset(0, 4.996),
                                          color: Color.fromRGBO(0, 0, 0, 0.071),
                                          blurRadius: 7.517,
                                          spreadRadius: -12,
                                        ),
                                        BoxShadow(
                                          offset: Offset(0, 8.956),
                                          color: Color.fromRGBO(0, 0, 0, 0.059),
                                          blurRadius: 13.475,
                                          spreadRadius: -12,
                                        ),
                                        BoxShadow(
                                          offset: Offset(0, 14.834),
                                          color: Color.fromRGBO(0, 0, 0, 0.051),
                                          blurRadius: 22.32,
                                          spreadRadius: -12,
                                        ),
                                        BoxShadow(
                                          offset: Offset(0, 24.442),
                                          color: Color.fromRGBO(0, 0, 0, 0.043),
                                          blurRadius: 36.776,
                                          spreadRadius: -12,
                                        ),
                                        BoxShadow(
                                          offset: Offset(0, 42.789),
                                          color: Color.fromRGBO(0, 0, 0, 0.035),
                                          blurRadius: 64.383,
                                          spreadRadius: -12,
                                        ),
                                        BoxShadow(
                                          offset: Offset(0, 92.381),
                                          color: Color.fromRGBO(0, 0, 0, 0.024),
                                          blurRadius: 139,
                                          spreadRadius: -12,
                                        ),
                                      ]),
                                  child: LayoutBuilder(
                                    builder: (context, constraints) {
                                      return Column(
                                        children: [
                                          // SizedBox(height: 10,),
                                          Container(
                                            width: constraints.maxWidth * .85,
                                            height: constraints.maxHeight * .73,
                                            clipBehavior: Clip.hardEdge,
                                            decoration: BoxDecoration(
                                                color: Colors.black12,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: CachedNetworkImage(
                                              imageUrl: ele.image,
                                              fit: BoxFit.fill,
                                              placeholderFadeInDuration:
                                                  const Duration(
                                                      milliseconds: 100),
                                              placeholder: (context, url) =>
                                                  const Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                color: Colors.white,
                                              )),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            ele.name,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                            maxLines: 1,
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(ele.author,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54)),
                                        ],
                                      );
                                    },
                                  )),
                            );
                          }).toList()),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
