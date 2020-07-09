import 'package:flutter/material.dart';

class ViewContainer extends StatelessWidget {

  final List<Widget> children;

  ViewContainer({this.children});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          ),
        ),
      ),
    );
  }
}