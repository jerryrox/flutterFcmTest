import 'package:flutter/material.dart';
import 'package:flutterFcmTest/models/Activity/ActivityInfo.dart';
import 'package:flutterFcmTest/models/common/DayType.dart';
import 'package:flutterFcmTest/utils/DateUtils.dart';

abstract class ActivityModel with ChangeNotifier {

  final List<ActivityInfo> activities = List<ActivityInfo>();


  List<ActivityInfo> getActivityForToday() {
    List<ActivityInfo> todaysActivity = List<ActivityInfo>();
    // Get today's DoW
    DayType today = DateUtils.getTodayType();
    // Select activities for today.
    todaysActivity.addAll(activities.where((a) => a.containsDay(today)));
    return todaysActivity;
  }

  Future add(ActivityInfo activityInfo);

  Future remove(ActivityInfo activityInfo);

  Future clear();
}