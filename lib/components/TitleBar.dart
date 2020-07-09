import 'package:flutter/material.dart';
import 'package:flutterFcmTest/components/TitleText.dart';

class TitleBar extends StatelessWidget {

  final String title;
  final List<Widget> children = List<Widget>();

  TitleBar({
    Key key,
    @required this.title,
    List<Widget> children,
  }) : super(key: key) {
    this.children.insert(0, TitleText(
      title
    ));
    this.children.insert(1, Expanded(
      flex: 1,
      child: Container()
    ));

    if(children != null) {
      this.children.addAll(children);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }
}