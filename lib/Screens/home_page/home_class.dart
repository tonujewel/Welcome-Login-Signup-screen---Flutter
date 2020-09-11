import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:login_sign_up/Screens/aboutus/about_us.dart';
import 'package:login_sign_up/Screens/bartender/bartender.dart';
import 'package:login_sign_up/Screens/hunt/hunt.dart';
import 'package:login_sign_up/Screens/review/hunt.dart';
import 'package:login_sign_up/Utils/Constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int bottomSelectedIndex = 0;

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );



  @override
  void initState() {
    super.initState();
  }


  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Last Orbitals'),
      ),
      body: SizedBox.expand(
          child: PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() => bottomSelectedIndex  = index);
            },
            children: <Widget>[
              AboutUs(),
              Hunt(),
              Review(),
              Bartender(),
            ],
          )
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: bottomSelectedIndex,
        showElevation: true,
        curve: Curves.easeInOutCubic,
        onItemSelected: (index) => setState(() {
          bottomTapped(index);
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.contacts),
            title: Text('About us'),
            activeColor: bottomNavColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.location_on),
            title: Text('Hunt'),
            activeColor: bottomNavColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.dock),
            title: Text('Submit',),
            activeColor: bottomNavColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.local_bar),
            title: Text('Bartender'),
            activeColor: bottomNavColor,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
