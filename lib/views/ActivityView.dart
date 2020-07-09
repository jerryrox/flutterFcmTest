import 'package:flutter/material.dart';
import 'package:flutterFcmTest/components/Activity/ActivityList.dart';
import 'package:flutterFcmTest/components/Activity/MenuBar.dart';
import 'package:flutterFcmTest/components/ViewContainer.dart';

class ActivityView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ViewContainer(
      children: [
        MenuBar(),
        Container(
          height: 10,
        ),
        ActivityList(),
      ],
    );
  }
}