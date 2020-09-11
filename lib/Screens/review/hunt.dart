import 'package:flutter/material.dart';

class Review extends StatefulWidget {
  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
          child: Text('Review and Submit',
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22))
      ),
    );
  }
}