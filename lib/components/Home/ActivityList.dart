import 'package:flutter/material.dart';
import 'package:flutterFcmTest/components/Home/ActivityCell.dart';

class ActivityList extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child:Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            ActivityCell(),
            ActivityCell()
          ],
        ),
      )
    );
  }
}
