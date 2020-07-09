import 'package:flutter/material.dart';

class Spacing extends StatelessWidget {

  final double height;
  final double width;

  Spacing.vertical({this.height = 10}) :
    width = 0;

  Spacing.horizontal({this.width = 10}) :
    height = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
    );
  }
}