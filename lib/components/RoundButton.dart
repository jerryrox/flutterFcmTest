import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {

  final String label;
  final double width;
  final Function onPressed;

  RoundButton(this.label, {
    Key key,
    this.width,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      width: width,
      child: FlatButton(
        child: Text(label),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22)
        ),
        color: Colors.purple[100],
      ),
    );
  }
}