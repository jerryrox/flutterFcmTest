import 'package:flutter/material.dart';

class MenuBar extends StatelessWidget {

  void _onCalendarButton() {
    print("_onCalendarButton");
  }

  void _onAddButton() {
    print("_onAddButton");
  }

  void _onMenuButton() {
    print("_onMenuButton");
  }
  
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          // TODO: Change this to today's date
          "Jul 8",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(),
        ),
        IconButton(
          icon: Icon(
            Icons.calendar_today,
            color: Colors.black,
            size: 20.0
          ),
          onPressed: _onCalendarButton,
        ),
        IconButton(
          icon: Icon(
            Icons.add,
            color: Colors.black,
            size: 20.0
          ),
          onPressed: _onAddButton,
        ),
        IconButton(
          icon: Icon(
            Icons.more_horiz,
            color: Colors.black,
            size: 20.0
          ),
          onPressed: _onMenuButton,
        ),
      ],
    );
  }
}
