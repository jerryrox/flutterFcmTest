import 'package:flutter/material.dart';
import 'package:flutterFcmTest/animations/FadeInRoute.dart';
import 'package:flutterFcmTest/components/FullScreenLoader.dart';
import 'package:flutterFcmTest/components/Login/GoogleLoginButton.dart';
import 'package:flutterFcmTest/components/Login/TitleDisplay.dart';
import 'package:flutterFcmTest/components/Spacing.dart';
import 'package:flutterFcmTest/components/ViewContainer.dart';
import 'package:flutterFcmTest/models/AuthModel.dart';
import 'package:flutterFcmTest/views/ActivityView.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {

  Future<bool> autoLogin(AuthModel model, BuildContext context) async {
    bool result = await model.autoLogin();
    if(result) {
      Navigator.pushAndRemoveUntil(context, FadeInRoute(view: ActivityView()), (route) => false);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final authModel = Provider.of<AuthModel>(context);

    return FutureBuilder(
      future: autoLogin(authModel, context),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.none ||
          snapshot.connectionState == ConnectionState.waiting) {
          return FullScreenLoader();
        }
        if(snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        }
        if(snapshot.data == null) {
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
        return Container();
      }
    );
  }
}