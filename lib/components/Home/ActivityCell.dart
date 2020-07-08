import 'package:flutter/material.dart';

class ActivityCell extends StatelessWidget {

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
                    "Title",
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
                    "Content"
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