import 'package:flutter/material.dart';

class Hunt extends StatefulWidget {
  @override
  _HuntState createState() => _HuntState();
}

class _HuntState extends State<Hunt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
          child: Text('Hunt',
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22))
      ),
    );
  }
}