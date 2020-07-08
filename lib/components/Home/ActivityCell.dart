import 'package:flutter/material.dart';
import 'package:flutterFcmTest/models/Activity/ActivityInfo.dart';

class ActivityCell extends StatelessWidget {

  ActivityInfo activity;


  ActivityCell({
    Key key,
    @required this.activity
  }) : super(key: key);

  void _onClicked() {
    print("_onClicked");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 3.0
      ),
      child: FlatButton(
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        onPressed: _onClicked,
        color: Colors.purple[300],
        child: Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    activity.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Days: ${activity.getDaysString()}"
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}