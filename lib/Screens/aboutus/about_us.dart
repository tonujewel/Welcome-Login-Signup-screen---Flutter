import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
          child: Text('About us',
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22))
      ),
    );
  }
}
