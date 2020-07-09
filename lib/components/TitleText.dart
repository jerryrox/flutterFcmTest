import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {

  final String title;

  TitleText(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.title,
      style: Theme.of(context).textTheme.headline4
    );
  }
}