import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutterFcmTest/models/ActivityModel.dart';
import 'package:flutterFcmTest/models/ActivityModelMemory.dart';
import 'package:flutterFcmTest/views/AddView.dart';
import 'package:provider/provider.dart';
import 'views/ActivityView.dart';

void main() {
  runApp(FcmTestApp());
}

Future<dynamic> onFcmBackgroundMessage(Map<String, dynamic> message) {
  print("onBackgroundMessage: $message");
}

class FcmTestApp extends StatefulWidget {

  @override
  _FcmTestState createState() => _FcmTestState();
}

class _FcmTestState extends State<FcmTestApp> {

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  String _token = "";
  String _message = "";

  @override
  void initState() {
    super.initState();
    _registerFcm();
    _getMessage();
  }

  void _getMessage() {
    _firebaseMessaging.configure(
      onBackgroundMessage: onFcmBackgroundMessage,
      onLaunch: (message) async {
        setState(() {
          this._message = message["notification"]["title"];
        });
        print("onLaunch: $message");
      },
      onMessage: (message) async {
        setState(() {
          this._message = message["notification"]["title"];
        });
        print("onMessage: $message");
      },
      onResume: (message) async {
        setState(() {
          this._message = message["notification"]["title"];
        });
        print("onResume: $message");
      }
    );
  }

  void _registerFcm() {
    _firebaseMessaging.getToken().then((value) {
      setState(() {
        this._token = value;
      });
      print("Token: $value");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FCM Test App",
      theme: ThemeData(
        accentColor: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<ActivityModel>(create: (_) => ActivityModelMemory()),
        ],
        child: SafeArea(
          child: AddView(),//ActivityView(),
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {



//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("FCM Test"),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text("Token: $_token"),
//               Text("Message: $_message"),
//               FlatButton(
//                 child: Text("Register device"),
//                 onPressed: _onRegisterButton,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }