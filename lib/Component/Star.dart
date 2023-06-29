import 'package:flutter/material.dart';

class Star extends StatefulWidget {
  const Star({super.key, required this.count, required this.color});

  final int count;
  final bool color;

  @override
  State<Star> createState() => _StarState();
}

class _StarState extends State<Star> {
  @override
  Widget build(BuildContext context) {
    Color mcolor = !widget.color ? Colors.white : Colors.grey.shade700;
    Color scolor = !widget.color ? Colors.white54 : Colors.black38;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: 21,
            height: 21,
            decoration: ShapeDecoration(
                color: widget.count >= 1 ? mcolor : scolor,
                shape: const StarBorder(
                  points: 5.00,
                  rotation: 0.00,
                  innerRadiusRatio: 0.48,
                  pointRounding: 0.33,
                  valleyRounding: 0.00,
                  squash: 0.00,
                ))),
        SizedBox(
          width: 5,
        ),
        Container(
            width: 21,
            height: 21,
            decoration: ShapeDecoration(
                color: widget.count >= 2 ? mcolor : scolor,
                shape: const StarBorder(
                  points: 5.00,
                  rotation: 0.00,
                  innerRadiusRatio: 0.48,
                  pointRounding: 0.33,
                  valleyRounding: 0.00,
                  squash: 0.00,
                ))),
        SizedBox(
          width: 5,
        ),
        Container(
            width: 21,
            height: 21,
            decoration: ShapeDecoration(
                color: widget.count >= 3 ? mcolor : scolor,
                shape: const StarBorder(
                  points: 5.00,
                  rotation: 0.00,
                  innerRadiusRatio: 0.48,
                  pointRounding: 0.33,
                  valleyRounding: 0.00,
                  squash: 0.00,
                ))),
        SizedBox(
          width: 5,
        ),
        Container(
            width: 21,
            height: 21,
            decoration: ShapeDecoration(
                color: widget.count >= 4 ? mcolor : scolor,
                shape: const StarBorder(
                  points: 5.00,
                  rotation: 0.00,
                  innerRadiusRatio: 0.48,
                  pointRounding: 0.33,
                  valleyRounding: 0.00,
                  squash: 0.00,
                ))),
        SizedBox(
          width: 5,
        ),
        Container(
            width: 21,
            height: 21,
            decoration: ShapeDecoration(
                color: widget.count == 5 ? mcolor : scolor,
                shape: const StarBorder(
                  points: 5.00,
                  rotation: 0.00,
                  innerRadiusRatio: 0.48,
                  pointRounding: 0.33,
                  valleyRounding: 0.00,
                  squash: 0.00,
                ))),
      ],
    );
  }
}
