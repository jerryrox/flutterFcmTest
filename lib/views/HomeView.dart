import 'package:flutter/material.dart';
import 'package:flutterFcmTest/components/Home/ActivityList.dart';
import 'package:flutterFcmTest/components/Home/MenuBar.dart';

class HomeView extends StatelessWidget {

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
              ActivityList(),
            ],
          ),
        ),
      ),
    );
  }
}