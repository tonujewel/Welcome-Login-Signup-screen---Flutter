import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_sign_up/Screens/Welcome/welcome_bg.dart';
import 'package:login_sign_up/Screens/login/login_screen.dart';
import 'package:login_sign_up/Screens/sign_up/sign_up_screen.dart';
import 'package:login_sign_up/Utils/Constants.dart';
import 'package:login_sign_up/components/rounded_button.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WelcomeBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                "Welcome to Last Orbital",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                    color: primaryColor)
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              'assets/icons/chat.svg',
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
              color: PrimaryLightColor,
              textColor: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
