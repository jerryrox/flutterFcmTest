import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterFcmTest/models/Activity/ActivityInfo.dart';
import 'package:flutterFcmTest/models/ActivityModel.dart';
import 'package:flutterFcmTest/models/Authenticator.dart';

class ActivityModelFirestore extends ActivityModel {

  final Firestore _db = Firestore.instance;

  FirebaseUser user;
  Map<String, dynamic> profile;
  

  ActivityModelFirestore() {
    authenticator.userStream.listen(this._onUserChanged);
    authenticator.profileStream.listen(this._onProfileChanged);
  }

  Future add(ActivityInfo activityInfo) async {
    try {
      this.allActivities.add(activityInfo);

      await _db.collection("users").document(user.uid).setData({
        "activities": this.allActivities
      });
      notifyListeners();
    }
    catch(e) {
      this.allActivities.remove(activityInfo);
    }
  }

  Future remove(ActivityInfo activityInfo) async {
    try {
      if(this.allActivities.remove(activityInfo)) {
        await _db.collection("users").document(user.uid).setData({
          "activities": this.allActivities
        });
      }
    }
    catch(e) {
      this.allActivities.add(activityInfo);
    }
  }

  Future clear() async {
    List<ActivityInfo> backup = List<ActivityInfo>.from(this.allActivities);
    try {
      this.allActivities.clear();
      await _db.collection("users").document(user.uid).setData({
        "activities": this.allActivities
      });
    }
    catch(e) {
      this.allActivities.addAll(backup);
    }
  }
  
  void _onUserChanged(FirebaseUser user) {
    this.user = user;
  }

  void _onProfileChanged(Map<String, dynamic> profile) {
    this.profile = profile;

    this.allActivities.clear();
    if(profile.containsKey("activities")) {
      this.allActivities.addAll(
        profile["activities"].map<ActivityInfo>((item) => ActivityInfo.fromMap(item))
      );
    }

    notifyListeners();
  }
}