import 'package:flutter/material.dart';
import 'package:login_sign_up/Screens/sign_up/sign_up_screen.dart';
import 'package:login_sign_up/Utils/Constants.dart';

class AlreadyHaveAccount extends StatelessWidget {
  final Function press;
  const AlreadyHaveAccount({
    Key key,
    this.press
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:<Widget> [
        Text(
          "Don't Have any account? ",
          style: TextStyle(color: primaryColor),
        ),

        GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context){
                  return SignUpScreen();
                }
              ));
            },
            child: Text(
                "Sign Up",
                style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold
                )
            )
        )
      ],
    );
  }
}
