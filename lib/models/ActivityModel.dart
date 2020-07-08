import 'package:flutter/material.dart';
import 'package:flutterFcmTest/models/Activity/ActivityInfo.dart';
import 'package:flutterFcmTest/models/common/DayType.dart';
import 'package:flutterFcmTest/utils/DateUtils.dart';

abstract class ActivityModel with ChangeNotifier {

  final List<ActivityInfo> allActivities = List<ActivityInfo>();

  bool displayAll = false;


  /// Returns all displayed activities.
  List<ActivityInfo> getActivities() {
    if(displayAll) {
      return List<ActivityInfo>.from(allActivities);
    }
    return _getActivityForToday();
  }

  void toggleDisplayAll() {
    displayAll = !displayAll;
    notifyListeners();
  }

  Future add(ActivityInfo activityInfo);

  Future remove(ActivityInfo activityInfo);

  Future clear();

  List<ActivityInfo> _getActivityForToday() {
    List<ActivityInfo> todaysActivity = List<ActivityInfo>();
    // Get today's DoW
    DayType today = DateUtils.getTodayType();
    // Select activities for today.
    todaysActivity.addAll(allActivities.where((a) => a.containsDay(today)));
    return todaysActivity;
  }
}