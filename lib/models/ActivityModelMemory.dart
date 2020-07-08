import 'package:flutterFcmTest/models/Activity/ActivityInfo.dart';
import 'package:flutterFcmTest/models/ActivityModel.dart';

class ActivityModelMemory extends ActivityModel {

  Future add(ActivityInfo activityInfo) {
    return Future.delayed(
      Duration(seconds: 1),
      () {
        this.activities.add(activityInfo);
        notifyListeners();
      }
    );
  }

  Future remove(ActivityInfo activityInfo) {
    return Future.delayed(
      Duration(seconds: 1),
      () {
        this.activities.remove(activityInfo);
        notifyListeners();
      }
    );
  }

  Future clear() {
    return Future.delayed(
      Duration(seconds: 1),
      () {
        this.activities.clear();
        notifyListeners();
      }
    );
  }
}