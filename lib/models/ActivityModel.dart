import 'package:flutter/material.dart';
import 'package:flutterFcmTest/models/Activity/ActivityInfo.dart';

class ActivityModel with ChangeNotifier {

  final List<ActivityInfo> activities = List<ActivityInfo>();


  void add(ActivityInfo activityInfo) {
    this.activities.add(activityInfo);
    notifyListeners();
  }

  void remove(ActivityInfo activityInfo) {
    this.activities.remove(activityInfo);
    notifyListeners();
  }

  void clear() {
    this.activities.clear();
    notifyListeners();
  }
}