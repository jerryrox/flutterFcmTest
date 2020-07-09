import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterFcmTest/components/TitleBar.dart';
import 'package:flutterFcmTest/components/TitleText.dart';
import 'package:flutterFcmTest/models/Activity/ActivityInfo.dart';
import 'package:flutterFcmTest/models/ActivityModel.dart';
import 'package:flutterFcmTest/models/common/DayType.dart';
import 'package:provider/provider.dart';

class MenuBar extends StatefulWidget {

  @override
  _MenuBarState createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {

  Random _random = Random();

  String getRandomName() => "Random name ${_random.nextInt(1000)}";

  List<DayType> getRandomDays() {
    var days = List<DayType>();
    DayType.values.forEach((day) {
      if(_random.nextDouble() < 0.35) {
        days.add(day);
      }
    });
    if(days.length == 0) {
      days.add(DayType.Monday);
    }
    return days;
  }

  void _onCalendarButton() {
    print("_onCalendarButton");
  }

  void _onAddButton(ActivityModel model) {
    print("_onAddButton");
    model.add(ActivityInfo(
      name: getRandomName(),
      days: getRandomDays()
    ));
  }

  void _onMenuButton(ActivityModel model) {
    print("_onMenuButton");
    model.toggleDisplayAll();
  }
  
  @override
  Widget build(BuildContext context) {

    final activityModel = Provider.of<ActivityModel>(context);
    final displayAll = activityModel.displayAll;

    return TitleBar(
      title: displayAll ? "All activities" : "Today's activities",
      children: [
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
          onPressed: () => _onAddButton(activityModel),
        ),
        IconButton(
          icon: Icon(
            Icons.more_horiz,
            color: Colors.black,
            size: 20.0
          ),
          onPressed: () => _onMenuButton(activityModel),
        ),
      ],
    );
  }
}
