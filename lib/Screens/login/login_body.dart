import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_sign_up/Screens/login/already_have_account_check.dart';
import 'package:login_sign_up/Screens/login/login_bg.dart';
import 'package:login_sign_up/Screens/sign_up/sign_up_screen.dart';
import 'package:login_sign_up/Utils/Constants.dart';
import 'package:login_sign_up/components/rounded_button.dart';
import 'package:login_sign_up/components/rounded_input_field.dart';
import 'package:login_sign_up/components/rounded_password_text_field.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoginBackground(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
        Text(
            "Let's enter Last Orbital's World",
            style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor,fontSize: 22.0)
        ),
        SizedBox(height: size.height * 0.05),
        SvgPicture.asset(
            "assets/icons/login.svg",
            height: size.height * 0.35
        ),
        SizedBox(height: size.height*0.03,)
        ,
        RoundedInputField(
          hintText: "Username",
          onChanged: (value){}),
            RoundedPasswordTextField(
              onChanged: (value){},
            ),
            RoundedButton(
              text: "Login",
              color: primaryColor,
              textColor: Colors.white,
              press: (){
                debugPrint("Tapped on login action");
              },
            ),
            SizedBox(height: size.height*0.03,),
            AlreadyHaveAccount(press: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ),
              );
            }
            )
      ]),
    );
  }
}
