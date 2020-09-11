import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_sign_up/Screens/home_page/home_class.dart';
import 'package:login_sign_up/Screens/login/login_screen.dart';
import 'package:login_sign_up/Screens/sign_up/sign_up_bg.dart';
import 'package:login_sign_up/Utils/Constants.dart';
import 'package:login_sign_up/components/rounded_button.dart';
import 'package:login_sign_up/components/rounded_email_field.dart';
import 'package:login_sign_up/components/rounded_input_field.dart';
import 'package:login_sign_up/components/rounded_password_text_field.dart';
import 'package:login_sign_up/network/ApiClient.dart';
import 'package:login_sign_up/network/url.dart';
import 'package:toast/toast.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String username = '', email = '', password = '';
    Size size = MediaQuery.of(context).size;
    return SignUpBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("SignUp",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                    fontSize: 22.0)),
            SvgPicture.asset("assets/icons/signup.svg",
                height: size.height * 0.30),
            RoundedInputField(
              hintText: "UserName",
              onChanged: (value) {
                username = value;
              },
            ),
            RoundedEmailField(
              hintText: "Email",
              onChanged: (value) {
                email = value;
              },
            ),
            RoundedPasswordTextField(
              onChanged: (value) {
                password = value;
              },
            ),
            RoundedButton(
                text: "SignUp",
                color: primaryColor,
                textColor: Colors.white,
                press: () {
                  if (username.isEmpty) {
                    Toast.show('Please enter Username', context,
                        duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                  } else if (email.isEmpty) {
                    Toast.show("Please enter Email", context,
                        duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                  } else if (password.isEmpty) {
                    Toast.show("Please enter Password", context,
                        duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                  } else {
                    showLoadingDialog(context);
                    doSignUpApiCall(context, username, email, password);
                  }
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Already have an account? ",
                  style: TextStyle(color: primaryColor),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginScreen();
                      }));
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          color: primaryColor, fontWeight: FontWeight.bold),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }

  void doSignUpApiCall(BuildContext context, String username, String email,
      String password) async {
    Map<String, dynamic> body = {
      'username': username,
      'email': email,
      'password': password
    };

    Map<String, dynamic> response = await ApiClient.Request(context,
        url: URL.register, body: body, method: Method.POST);

    try {
      if (response.containsKey("message")) {
        Toast.show(response['message'], context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
        Navigator.of(context).pop();
      } else if (response.containsKey('username')) {
        Navigator.of(context).pop();
        Toast.show('Registration success', context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HomePage();
        }));
      }
    } catch (e) {}
  }
}
