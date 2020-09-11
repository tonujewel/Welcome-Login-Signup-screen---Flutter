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
  bool _showPassword = true;


  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: widget.onChanged,
        obscureText: _showPassword,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          hintText: "Password",
          border: InputBorder.none,
          icon: Icon(
              Icons.lock,color: primaryColor
          ),
          suffixIcon: IconButton(
            onPressed: (){
              _showPassword = !_showPassword;
              print(_showPassword);
              setState(() {
              });
            },
            icon: Icon(!_showPassword ? Icons.visibility : Icons.visibility_off, color: primaryColor,),
          ),
        ),
      ),
    );
  }
}
