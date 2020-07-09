import 'package:flutter/material.dart';
import 'package:flutterFcmTest/components/TitleText.dart';

class SectionBar extends StatelessWidget {

  final String title;
  final List<Widget> children = List<Widget>();

  SectionBar({
    Key key,
    @required this.title,
    Widget titleWidget,
    List<Widget> children,
  }) : super(key: key) {
    this.children.insert(0, titleWidget ?? getDefaultTitleWidget(title));
    this.children.insert(1, Expanded(
      flex: 1,
      child: Container()
    ));

    if(children != null) {
      this.children.addAll(children);
    }
  }

  Widget getDefaultTitleWidget(String title) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 19
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }
}