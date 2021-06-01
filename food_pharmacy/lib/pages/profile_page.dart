import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodpharmacy/components/custom_nav_drawer.dart';
import 'package:foodpharmacy/components/custom_pop_menu.dart';
import '../responsive/size_config.dart';

class ProfilePage extends StatefulWidget {
  static String routeName = "/profile_page";
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          CustomPopMenu(),
        ],
      ),
      drawer: CustomNavDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: SizeConfig.safeBlockVertical*2,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Profile',
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 6.5,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 3,
            ),
            Column(
              children: [
                customProfile(Icons.person_outline, 'John Doe'),
                customProfile(Icons.email_outlined, 'john@test.com'),
                customProfile(Icons.lock_outline_rounded, '*********'),
                customProfile(Icons.phone, '+1 23 456789'),
                customProfile(Icons.apartment_sharp, 'London'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget customProfile(IconData iconData, String title) {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.blockSizeVertical * 1,
        ),
        Row(
          children: [
            Icon(
              iconData,
              size: SizeConfig.safeBlockHorizontal * 7,
            ),
            SizedBox(
              width: SizeConfig.blockSizeVertical * 5,
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.green,
                fontSize: SizeConfig.safeBlockHorizontal * 5,
              ),
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical * 1,
        ),
        Divider(
          color: Colors.black,
        ),
      ],
    );
  }
}
