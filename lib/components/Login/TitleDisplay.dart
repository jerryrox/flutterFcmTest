import 'package:flutter/material.dart';

class TitleDisplay extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/logo.png",
          ),
          Text(
            "Test Activity App",
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }
}