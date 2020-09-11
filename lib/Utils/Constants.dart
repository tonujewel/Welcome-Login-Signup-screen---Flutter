import 'package:flutter/material.dart';

const primaryColor = Color(0xFF6F35A5);
const PrimaryLightColor = Color(0xFFF1E6FF);
const bottomNavColor = Color(0xFF6F35A5);

 void shoWLoadingDialog(BuildContext context){
  showDialog(
      context: context,
      child: SizedBox(
        width: 150,
        height: 150,
        child: Dialog(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: Align(
                    alignment: Alignment.center,
                    child: Material(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      ),
                      shape: CircleBorder(),
                      clipBehavior: Clip.antiAlias,
                    ),
                  ),
                ),
              ],
            )
        ),
      )
  );
}