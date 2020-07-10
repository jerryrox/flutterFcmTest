import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthModel with ChangeNotifier {

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _db = Firestore.instance;

  FirebaseUser user;
  Map<String, dynamic> profile;
  bool isLoading;

  StreamSubscription<Map<String, dynamic>> _profileStream;

  /// Returns whether the user is currently logged in.
  bool get isLoggedIn => user != null;


  AuthModel() {
    _auth.onAuthStateChanged.listen(this._onAuthStateChange);
  }

  /// Signs in using google login.
  Future<FirebaseUser> googleSignIn() async {
    _setLoading(true);

    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken
    );
    AuthResult authResult = await _auth.signInWithCredential(credential);
    updateUserData(authResult.user);

    _setLoading(false);
    return authResult.user;
  }
  
  void updateUserData(FirebaseUser user) async {
    DocumentReference ref = _db.collection("users").document(user.uid);
    await ref.setData({
      "uid": user.uid,
      "email": user.email,
      "photoURL": user.photoUrl,
      "displayName": user.displayName,
    }, merge: true);
  }

  void signOut() {
    _auth.signOut();
  }

  void _setLoading(bool isLoading) {
    this.isLoading = isLoading;
    notifyListeners();
  }

  void _loadProfile() {
    // Cancel previous stream subscription.
    if(_profileStream != null) {
      _profileStream.cancel();
      _profileStream = null;
    }

    // If invalid user, just set to an empty user data.
    if(user == null) {
      _onProfileChange(Map<String, dynamic>());
      return;
    }

    // Listen to user data change.
    _profileStream = _db
      .collection("users")
      .document(user.uid)
      .snapshots()
      .map((snap) => snap.data)
      .listen(this._onProfileChange);
  }

  void _onAuthStateChange(FirebaseUser user) {
    this.user = user;
    _loadProfile();
    notifyListeners();
  }

  void _onProfileChange(Map<String, dynamic> profile) {
    this.profile = profile;
    notifyListeners();
  }
}