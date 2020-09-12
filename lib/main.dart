import 'package:flutter/material.dart';
import 'package:login_sign_up/Screens/Welcome/welcome_screen.dart';
import 'package:login_sign_up/Utils/Constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white
      ),

      home: WelcomeScreen(),
    );
  }
}
