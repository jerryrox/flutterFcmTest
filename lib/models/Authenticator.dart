import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authenticator {

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
    "email"
  ]);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _db = Firestore.instance;

  Stream<FirebaseUser> userStream;
  Stream<Map<String, dynamic>> profileStream;

  FirebaseUser _user;
  Map<String, dynamic> _profile;
  StreamSubscription<Map<String, dynamic>> _profileListener;

  /// Returns whether the user is currently logged in.
  bool get isLoggedIn => _user != null;


  Authenticator() {
    this.userStream = _auth.onAuthStateChanged;
    this.userStream.listen(this._onAuthStateChange);
  }

  /// Performs automatic login and returns whether the user is authenticated successfully.
  Future<bool> autoLogin() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    if(user == null)
      return false;

    await updateUserData(user);
    return true;
  }

  /// Signs in using google login.
  Future<FirebaseUser> googleSignIn() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken
    );
    AuthResult authResult = await _auth.signInWithCredential(credential);
    await updateUserData(authResult.user);

    return authResult.user;
  }
  
  Future<void> updateUserData(FirebaseUser user) async {
    DocumentReference ref = _db.collection("users").document(user.uid);
    await ref.setData({
      "uid": user.uid,
      "email": user.email,
      "photoURL": user.photoUrl,
      "displayName": user.displayName,
    }, merge: true);
  }

  Future<void> signOut() {
    return _auth.signOut();
  }

  void _loadProfile(FirebaseUser user) {
    // Cancel previous stream subscription.
    if(_profileListener != null) {
      _profileListener.cancel();
      _profileListener = null;
    }

    // If invalid user, just set to an empty user data.
    if(user == null) {
      _onProfileChange(Map<String, dynamic>());
      return;
    }

    // Listen to user data change.
    _profileListener = _db
      .collection("users")
      .document(user.uid)
      .snapshots()
      .map((snap) => snap.data)
      .listen(this._onProfileChange);
  }

  void _onAuthStateChange(FirebaseUser user) {
    this._user = user;
    _loadProfile(user);
  }

  void _onProfileChange(Map<String, dynamic> profile) {
    this._profile = profile;
  }
}
final authenticator = Authenticator();