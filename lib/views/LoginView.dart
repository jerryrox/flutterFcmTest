import 'package:flutter/material.dart';
import 'package:flutterFcmTest/components/Login/GoogleLoginButton.dart';
import 'package:flutterFcmTest/components/Login/TitleDisplay.dart';
import 'package:flutterFcmTest/components/Spacing.dart';
import 'package:flutterFcmTest/components/ViewContainer.dart';

class LoginView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ViewContainer(
      children: [
        Expanded(
          flex: 1,
          child: TitleDisplay(),
        ),
        Spacing.vertical(height: 50,),
        GoogleLoginButton(),
        Spacing.vertical(height: 50,),
      ],
    );
  }
}