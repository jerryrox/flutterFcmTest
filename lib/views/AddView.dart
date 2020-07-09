import 'package:flutter/material.dart';
import 'package:flutterFcmTest/components/Add/ActivityNameInput.dart';
import 'package:flutterFcmTest/components/Add/DaysFilter.dart';
import 'package:flutterFcmTest/components/RoundButton.dart';
import 'package:flutterFcmTest/components/SectionBar.dart';
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

  void _onActivityNameSubmitted(String name) {
    setState(() {
      this._name = name.trim();
    });
  }

  void _onDayChanged(List<DayType> days) {
    setState(() {
      this._days = days;
    });
  }

  void _onCloseButton() {
    Navigator.pop(context);
  }

  void _onCreateButton(ActivityModel activityModel) async {
    if(_name == null || _name.length == 0) {
      print("Invalid name");
      return;
    }
    if(_days == null || _days.length == 0) {
      print("Invalid days");
      return;
    }

    await activityModel.add(ActivityInfo(
      name: _name,
      days: _days
    ));
    print("Added model");
    Navigator.of(context).pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final activityModel = Provider.of<ActivityModel>(context);

    return ViewContainer(
      children: [
        TitleBar(
          title: "New activity",
          children: [
            IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.black,
                size: 20,
              ),
              onPressed: _onCloseButton,
            )
          ],
        ),
        Spacing.vertical(height: 40,),
        ActivityNameInput(
          onSubmitted: _onActivityNameSubmitted,
        ),
        Spacing.vertical(height: 40,),
        SectionBar(
          title: "Days",
        ),
        Spacing.vertical(height: 20,),
        DaysFilter(
          onChanged: _onDayChanged,
        ),
        Spacing.vertical(height: 40,),
        RoundButton(
          "Create",
          width: 160,
          onPressed: () => _onCreateButton(activityModel),
        ),
      ],
    );
  }
}