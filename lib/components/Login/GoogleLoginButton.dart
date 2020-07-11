import 'package:flutter/material.dart';
import 'package:flutterFcmTest/components/RoundButton.dart';
import 'package:flutterFcmTest/models/AuthModel.dart';
import 'package:provider/provider.dart';

class GoogleLoginButton extends StatelessWidget {

  void _onLoginButton(AuthModel model) {
    model.googleSignIn();
  }

  @override
  Widget build(BuildContext context) {
    final authModel = Provider.of<AuthModel>(context);
    
    return RoundButton(
      "Log in with Google",
      width: 250.0,
      onPressed: () => _onLoginButton(authModel),
    );
  }
}