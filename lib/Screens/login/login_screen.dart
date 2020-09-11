import 'package:flutter/material.dart';
import 'package:login_sign_up/Screens/login/login_body.dart';
import 'package:login_sign_up/model/User.dart';

class LoginScreen extends StatelessWidget {

  User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LoginBody(),);
  }
}
