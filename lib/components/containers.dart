import 'package:flutter/material.dart';

class Boxes extends StatelessWidget {
  final double width;
  final double height;
  final double margin;
  final Widget? child;
  final Color? color;
  Boxes(
      {Key? key,
      required this.width,
      required this.height,
      required this.margin,
      this.child,
      this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var _color = color;
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10,
        ),
        color: _color ?? const Color(0xFF1D1E33),
      ),
      child: child,
    );
  }
}
