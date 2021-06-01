import 'package:flutter/material.dart';
import 'package:foodpharmacy/components/custom_nav_drawer.dart';

class NavDrawerPrac extends StatefulWidget {
  @override
  _NavDrawerPracState createState() => _NavDrawerPracState();
}

class _NavDrawerPracState extends State<NavDrawerPrac> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Nav Drawer'),
          ),
          body: Center(
            child: Text(
              'Home',
            ),
          ),
          drawer: CustomNavDrawer(),
        ),
      ),
    );
  }
}
