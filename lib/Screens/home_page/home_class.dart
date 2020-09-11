import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:login_sign_up/Utils/Constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Last Orbitals'),
      ),
      body: Center(child: Text('Welcome to Last Orbital')),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        showElevation: true,
        curve: Curves.easeInOutCubic,
        onItemSelected: (index) => setState(() {
          currentIndex = index;
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
