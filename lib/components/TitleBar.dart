import 'package:flutter/material.dart';
import 'package:flutterFcmTest/components/SectionBar.dart';
import 'package:flutterFcmTest/components/TitleText.dart';

class TitleBar extends StatelessWidget {

  final String title;
  final List<Widget> children;

  TitleBar({
    Key key,
    @required this.title,
    this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SectionBar(
      title: title,
      titleWidget: TitleText(
        title
      ),
      children: children,
    );
  }
}