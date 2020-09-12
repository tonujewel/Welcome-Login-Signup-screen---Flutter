import 'package:flutter/material.dart';
import 'package:login_sign_up/Utils/Constants.dart';
import 'package:login_sign_up/language/Language.dart';
import 'package:login_sign_up/network/url.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {

  Language language = Language();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children:<Widget> [
          Image.asset(
              'assets/images/app-logo.png'
          ),
          Center(
            child: Text('Welcome',
            style: TextStyle(color: Colors.green, fontSize: 24)),
          ),
          SizedBox( height: 10),
          Center(
            child: Text('to our journey!',
            style: TextStyle(color: Colors.green, fontSize: 24)),
          ),
          SizedBox( height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(language.missionOne,style: TextStyle(color: Colors.white,fontSize: 15)),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
              child: Image.asset(
                  'assets/images/couple_image.png'
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(language.Mission2,style: TextStyle(color: Colors.white,fontSize: 15)),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: Image.asset(
                'assets/images/two.PNG'
            ),
          ),
          Center(
            child: Text('Get in Touch with Us',
                style: TextStyle(color: Colors.white, fontSize: 24,fontWeight: FontWeight.bold)),
          ),

          Row(
            children:<Widget> [
              GestureDetector(
                  onTap: ()=>launchURL(URL.Facebook),
                  child: Image.asset('assets/images/facebook.png',height: 45,width: 45,fit: BoxFit.fill,color: primaryColor)
              ),
            ],
          )
        ],
      ),
    );
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
