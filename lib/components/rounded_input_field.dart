import 'package:flutter/material.dart';
import 'package:login_sign_up/Utils/Constants.dart';
import 'package:login_sign_up/components/rounded_text_field.dart';

class RoundedInputField extends StatelessWidget{
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
      Key key,
      this.hintText,
      this.icon = Icons.person,
      this.onChanged,
  } ): super (key:key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(icon, color: primaryColor,),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}