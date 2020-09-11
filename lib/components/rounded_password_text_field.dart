import 'package:flutter/material.dart';
import 'package:login_sign_up/Utils/Constants.dart';
import 'package:login_sign_up/components/rounded_text_field.dart';

class RoundedPasswordTextField extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const RoundedPasswordTextField({
    Key key, this.onChanged,
  }) : super(key: key);

  @override
  _RoundedPasswordTextFieldState createState() => _RoundedPasswordTextFieldState();
}

class _RoundedPasswordTextFieldState extends State<RoundedPasswordTextField> {
  @override
  Widget build(BuildContext context) {

    bool _showPassword = false;
    void _togglevisibility() {
      setState(() {
        _showPassword = !_showPassword;
      });
    }

    return TextFieldContainer(
      child: TextField(
        onChanged: widget.onChanged,
        obscureText: !_showPassword,
        decoration: InputDecoration(
          hintText: "Password",
          border: InputBorder.none,
          icon: Icon(
              Icons.lock,color: primaryColor
          ),
          suffixIcon: GestureDetector(
            onTap: (){
              _togglevisibility();
            },
            child: Icon(_showPassword ? Icons.visibility : Icons.visibility_off, color: primaryColor,),
          ),
        ),
      ),
    );
  }
}


