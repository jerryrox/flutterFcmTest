import 'package:flutter/material.dart';
import 'package:flutterFcmTest/components/Add/ActivityNameInput.dart';
import 'package:flutterFcmTest/components/Spacing.dart';
import 'package:flutterFcmTest/components/TitleBar.dart';
import 'package:flutterFcmTest/components/ViewContainer.dart';
import 'package:flutterFcmTest/models/Activity/ActivityInfo.dart';
import 'package:flutterFcmTest/models/ActivityModel.dart';
import 'package:flutterFcmTest/models/common/DayType.dart';
import 'package:provider/provider.dart';

class AddView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {

  String _name = "";
  List<DayType> _days = List<DayType>();

  ActivityModel get activityModel => Provider.of(context);

  void _onActivityNameSubmitted(String name) {
    print("ActivityName: $name");
  }

  void _onCreateButton() {
    activityModel.add(ActivityInfo(
      name: _name,
      days: _days
    ));
  }

  @override
  Widget build(BuildContext context) {
    return ViewContainer(
      children: [
        TitleBar(
          title: "New activity",
        ),
        Spacing.vertical(height: 20,),
        ActivityNameInput(
          onSubmitted: _onActivityNameSubmitted,
        ),
      ],
    );
  }
}