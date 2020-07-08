import 'package:flutter/material.dart';
import 'package:flutterFcmTest/models/Activity/ActivityInfo.dart';

abstract class ActivityModel with ChangeNotifier {

  final List<ActivityInfo> activities = List<ActivityInfo>();


  Future add(ActivityInfo activityInfo);

  Future remove(ActivityInfo activityInfo);

  Future clear();
}