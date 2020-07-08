import 'package:flutter/material.dart';
import 'package:flutterFcmTest/components/Activity/ActivityCell.dart';
import 'package:flutterFcmTest/models/ActivityModel.dart';
import 'package:provider/provider.dart';

class ActivityList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final activityModel = Provider.of<ActivityModel>(context);

    return Expanded(
      flex: 1,
      child:Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: activityModel.activities.length,
          itemBuilder: (context, index) {
            return ActivityCell(
              activity: activityModel.activities[index],
            );
          },
        ),
      )
    );
  }
}
