import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterFcmTest/models/Authenticator.dart';

class AuthModel with ChangeNotifier {

  FirebaseUser user;
  
  /// Returns whether the user is currently logged in.
  bool get isLoggedIn => authenticator.isLoggedIn;


  AuthModel() {
    authenticator.userStream.listen(this._onUserChanged);
  }
  
  void _onUserChanged(FirebaseUser user) {
    this.user = user;
    notifyListeners();
  }
}