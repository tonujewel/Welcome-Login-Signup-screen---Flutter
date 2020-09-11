import 'package:flutter/material.dart';
import 'package:login_sign_up/Utils/Constants.dart';

class Bartender extends StatefulWidget {
  @override
  _BartenderState createState() => _BartenderState();
}

class _BartenderState extends State<Bartender> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
          child: Text('Bartender',
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)
          )
      ),
    );
  }
}
