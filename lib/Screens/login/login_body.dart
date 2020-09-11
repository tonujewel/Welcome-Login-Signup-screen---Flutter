import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_sign_up/Screens/home_page/home_class.dart';
import 'package:login_sign_up/Screens/login/already_have_account_check.dart';
import 'package:login_sign_up/Screens/login/login_bg.dart';
import 'package:login_sign_up/Screens/sign_up/sign_up_screen.dart';
import 'package:login_sign_up/Utils/Constants.dart';
import 'package:login_sign_up/components/rounded_button.dart';
import 'package:login_sign_up/components/rounded_input_field.dart';
import 'package:login_sign_up/components/rounded_password_text_field.dart';
import 'package:login_sign_up/model/User.dart';
import 'package:login_sign_up/network/ApiClient.dart';
import 'package:login_sign_up/network/url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class LoginBody extends StatefulWidget {

  const LoginBody({
    Key key,
  }) : super(key: key);

  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  @override
  Widget build(BuildContext context) {
    String userName = "", password = "";
    Size size = MediaQuery.of(context).size;
    return LoginBackground(
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Let's enter Last Orbital's World",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                      fontSize: 22.0)),
              SizedBox(height: size.height * 0.05),
              SvgPicture.asset("assets/icons/login.svg",
                  height: size.height * 0.35),
              SizedBox(
                height: size.height * 0.03,
              ),
              RoundedInputField(
                  hintText: "Username",
                  onChanged: (value) {
                    userName = value;
                  }),
              RoundedPasswordTextField(
                onChanged: (value) {
                  password = value;
                },
              ),

              RoundedButton(
                text: "Login",
                color: primaryColor,
                textColor: Colors.white,
                press: () {
                  if (userName.isEmpty) {
                    Toast.show("Please Enter Username", context,
                        duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                  } else if (password.isEmpty) {
                    Toast.show("Please Enter password", context,
                        duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                  } else {
                    shoWLoadingDialog(context);
                    doLogin(context,userName,password);
                  }
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAccount(press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              })
            ]),
      ),
    );
  }

  void doLogin(BuildContext context, String userName, String password) async {
    String url = URL.login;
    Map<String, dynamic> body = {
      'username': userName,
      'password': password
    };

    Map<String, dynamic> response = await ApiClient.Request(context,
        url: url, body: body, method: Method.POST);
    try {
      if (response.containsKey("message")) {
        Navigator.of(context).pop();
        Toast.show('Username or password is incorrect', context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      } else if (response.containsKey("token")) {
        User user = User.fromJson(response);
        user.username = userName;
        user.password = password;

        SharedPreferences pref;
        pref.setString('user', json.encode(user.toString()));

        Toast.show("login success", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);

        Navigator.of(context).pop();
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HomePage();
        }));
      }else{

      }
    } catch (e) {

    }
  }
}
