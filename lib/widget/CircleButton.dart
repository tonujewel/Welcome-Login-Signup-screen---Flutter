import 'package:flutter/material.dart';
import 'package:login_sign_up/Theme/theme.dart';
import 'package:login_sign_up/Dimension/Dimension.dart';

CircleButton({@required Function onTap,@required Widget child,bool loading}){
  return GestureDetector(
    onTap:onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: Themes.Primary,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Themes.Primary.withAlpha(Dimension.Alpha),
                offset: Offset(1, -2),
                blurRadius: 5),
            BoxShadow(
                color: Themes.Primary.withAlpha(Dimension.Alpha),
                offset: Offset(-1, 2),
                blurRadius: 5)
          ]),
      child: loading ? SizedBox(
        width: 25,
        height: 25,
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
      ) : child,
    ),
  );
}