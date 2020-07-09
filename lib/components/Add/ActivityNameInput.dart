import 'package:flutter/material.dart';

class ActivityNameInput extends StatelessWidget {

  final Function(String) onSubmitted;

  ActivityNameInput({
    Key key,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.purple[300],
        ),
        child: Center(
          child: TextField(
            onSubmitted: onSubmitted,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: "Enter activity name",
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero
            ),
          ),
        ),
      ),
    );
  }
}