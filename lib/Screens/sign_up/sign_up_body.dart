import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_sign_up/Screens/login/login_screen.dart';
import 'package:login_sign_up/Screens/sign_up/sign_up_bg.dart';
import 'package:login_sign_up/Utils/Constants.dart';
import 'package:login_sign_up/components/rounded_button.dart';
import 'package:login_sign_up/components/rounded_email_field.dart';
import 'package:login_sign_up/components/rounded_input_field.dart';
import 'package:login_sign_up/components/rounded_password_text_field.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SignUpBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "SignUp",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: primaryColor,
                fontSize: 22.0)
            ),
          SvgPicture.asset(
              "assets/icons/signup.svg",
            height: size.height * 0.30
          ),
          RoundedInputField(
            hintText: "UserName",
            onChanged: (value){},
          ),
          RoundedEmailField(
            hintText: "Email",
            onChanged: (value){},
          ),
          RoundedPasswordTextField(
            onChanged: (value){},
          ),
          RoundedButton(
              text: "SignUp",
              color: primaryColor,
              textColor: Colors.white,
              press: (){}
              ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Already have an account? ",
              style: TextStyle(
                color: primaryColor
              ),
              ),

              GestureDetector(
                onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context){
                    return LoginScreen();
                  }
                ));
                },
                  child: Text(
                    "Sign In",
                    style:TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold
                    ),
                  )
              ),
            ],
          )
        ],

      ),

    );
  }
}
