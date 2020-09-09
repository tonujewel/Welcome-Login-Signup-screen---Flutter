import 'package:flutter/material.dart';
import 'package:login_sign_up/Utils/Constants.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  final String hintText;
  final ValueChanged<String> onChange;
  const TextFieldContainer({
    Key key,
    this.child,
    this.hintText,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: PrimaryLightColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
