import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopapp/Screens/Detail.dart';

import 'Screens/Home.dart';
import 'Screens/Login.dart';
import 'Screens/SignUp.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print(snapshot.error);
          return Container();
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Shop App',
            theme: ThemeData(primaryColor: Colors.redAccent),
            initialRoute: FirebaseAuth.instance.currentUser == null
                ? "login_screen"
                : "Home_screen",
            routes: {
              "login_screen": (context) => Login(),
              "signUp_screen": (context) => SignUp(),
              "Home_screen": (context) => Home(true),
              //"profile_screen": (context) => Profile(),
            },
          );
        }

        return Container();
      },
    );
  }
}
