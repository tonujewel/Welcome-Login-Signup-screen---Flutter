import 'package:flutter/material.dart';
import 'package:login_sign_up/Utils/Constants.dart';
import 'package:login_sign_up/components/rounded_text_field.dart';

class RoundedPasswordTextField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordTextField({
    Key key, this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        obscureText: true,
        decoration: InputDecoration(
          hintText: "Password",
          border: InputBorder.none,
          icon: Icon(
              Icons.lock,color: primaryColor
          ),
          suffixIcon: Icon(
              Icons.visibility,color: primaryColor
          ),
        ),
      ),
    );
  }
}


