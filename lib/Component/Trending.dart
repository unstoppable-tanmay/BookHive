import 'package:bookhive/Services/getData.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'ShowBook.dart';
import 'Star.dart';

class Trending extends StatelessWidget {
  const Trending({
    super.key,
    required this.ele,
    required this.width,
    required this.localwidth,
    required this.textColor,
  });

  final BookData ele;
  final width;
  final localwidth;
  final textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ShowDialog(width, context, ele);
      },
      child: Container(
          width: width,
          padding:
              const EdgeInsets.only(left: 20, right: 10, top: 15, bottom: 15),
          decoration: BoxDecoration(
              color: hexToColor(ele.color),
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Container(
                width: localwidth * .3,
                height: double.infinity,
                margin: EdgeInsets.only(top: 6, bottom: 6),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black26,
                ),
                child: CachedNetworkImage(
                  imageUrl: ele.image,
                  placeholderFadeInDuration: Duration(milliseconds: 100),
                  placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                    color: Colors.white,
                  )),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: localwidth * .5,
                      child: Text(
                        ele.name,
                        style: TextStyle(
                            overflow: TextOverflow.fade,
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: textColor ? Colors.black : Colors.white),
                        maxLines: 2,
                      ),
                    ),
                    Text(ele.author,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color:
                                textColor ? Colors.black54 : Colors.white54)),
                    const SizedBox(
                      height: 25,
                    ),
                    Star(count: int.parse(ele.star), color: textColor),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: textColor ? Colors.black12 : Colors.white30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${ele.size} MB",
                            style: TextStyle(
                                fontSize: 15,
                                color: textColor ? Colors.black : Colors.white),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            "${ele.pages} Pages",
                            style: TextStyle(
                                fontSize: 15,
                                color: textColor ? Colors.black : Colors.white),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
