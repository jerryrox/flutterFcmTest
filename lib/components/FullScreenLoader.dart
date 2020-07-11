import 'package:flutter/material.dart';
import 'package:flutterFcmTest/components/ViewContainer.dart';

class FullScreenLoader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ViewContainer(
      children: [
        Expanded(
          flex: 1,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }
}