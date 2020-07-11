import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterFcmTest/models/Authenticator.dart';

class AuthModel with ChangeNotifier {

  /// Returns whether the user is currently logged in.
  bool get isLoggedIn => authenticator.isLoggedIn;


  AuthModel() {
    authenticator.userStream.listen(this._onUserChanged);
    this._onUserChanged(authenticator.currentUser);
  }

  Future<bool> autoLogin() => authenticator.autoLogin();

  Future googleSignIn() => authenticator.googleSignIn();
  
  void _onUserChanged(FirebaseUser user) {
    notifyListeners();
  }
}