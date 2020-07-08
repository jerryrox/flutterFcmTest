import 'package:flutter/material.dart';
import 'package:flutterFcmTest/components/Activity/ActivityList.dart';
import 'package:flutterFcmTest/components/Activity/MenuBar.dart';

class ActivityView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MenuBar(),
              Container(
                height: 10,
              ),
              ActivityList(),
            ],
          ),
        ),
      ),
    );
  }
}