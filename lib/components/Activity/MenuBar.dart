import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterFcmTest/animations/SlideInRoute.dart';
import 'package:flutterFcmTest/components/TitleBar.dart';
import 'package:flutterFcmTest/models/ActivityModel.dart';
import 'package:flutterFcmTest/views/AddView.dart';
import 'package:provider/provider.dart';

class MenuBar extends StatefulWidget {

  @override
  _MenuBarState createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {

  void _onCalendarButton() {
    print("_onCalendarButton");
  }

  void _onAddButton(ActivityModel model) {
    print("_onAddButton");
    Navigator.push(
      context,
      SlideInRoute(view: AddView())
    );
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
