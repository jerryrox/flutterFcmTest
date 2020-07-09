import 'package:flutter/material.dart';

class RoundToggle extends StatelessWidget {

  final String label;
  final double size;
  final bool isToggled;
  final Function onPressed;

  RoundToggle({
    Key key,
    this.label = "",
    this.size = 36,
    this.isToggled = false,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: FlatButton(
        padding: EdgeInsets.zero,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 10,
          ),
          textAlign: TextAlign.center,
          softWrap: false,
          overflow: TextOverflow.visible,
        ),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size / 2),
        ),
        color: isToggled ? Colors.purple : Colors.purple[50],
        textColor: isToggled ? Colors.white : Colors.black,
      ),
    );
  }
}