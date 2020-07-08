import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutterFcmTest/models/ActivityModel.dart';
import 'package:provider/provider.dart';
import 'views/ActivityView.dart';

void main() {
  runApp(FcmTestApp());
}

class FcmTestApp extends StatelessWidget {

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
          ChangeNotifierProvider(create: (_) => ActivityModel()),
        ],
        child: SafeArea(
          child: ActivityView(),
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MyApp());
// }

// Future<dynamic> onFcmBackgroundMessage(Map<String, dynamic> message) {
//   print("onBackgroundMessage: $message");
// }

// class MyApp extends StatefulWidget {

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {

//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

//   String _token = "";
//   String _message = "";

//   @override
//   void initState() {
//     super.initState();
//     _getMessage();
//   }

//   void _getMessage() {
//     _firebaseMessaging.configure(
//       onBackgroundMessage: onFcmBackgroundMessage,
//       onLaunch: (message) async {
//         setState(() {
//           this._message = message["notification"]["title"];
//         });
//         print("onLaunch: $message");
//       },
//       onMessage: (message) async {
//         setState(() {
//           this._message = message["notification"]["title"];
//         });
//         print("onMessage: $message");
//       },
//       onResume: (message) async {
//         setState(() {
//           this._message = message["notification"]["title"];
//         });
//         print("onResume: $message");
//       }
//     );
//   }

//   void _onRegisterButton() {
//     _firebaseMessaging.getToken().then((value) {
//       setState(() {
//         this._token = value;
//       });
//       print("Token: $value");
//     });
//   }

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