import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterFcmTest/models/Authenticator.dart';

class AuthModel with ChangeNotifier {

  FirebaseUser user;
  Map<String, dynamic> profile;
  
  /// Returns whether the user is currently logged in.
  bool get isLoggedIn => authenticator.isLoggedIn;


  AuthModel() {
    authenticator.userStream.listen(this._onUserChanged);
    authenticator.profileStream.listen(this._onProfileChanged);
  }
  
  void _onUserChanged(FirebaseUser user) {
    this.user = user;
    notifyListeners();
  }

  void _onProfileChanged(Map<String, dynamic> profile) {
    this.profile = profile;
    notifyListeners();
  }
}