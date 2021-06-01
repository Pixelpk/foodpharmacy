import 'package:flutter/material.dart';
import 'package:foodpharmacy/media_config.dart';
import 'package:foodpharmacy/pages/recommendation/health_studio/health_studio_screen.dart';
import 'package:line_icons/line_icons.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getProportionateScreenWidth(10),
            ),
            Text(
              'Categories',
              style: TextStyle(
                color: Colors.green,
                fontSize: getProportionateScreenWidth(20),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(10),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, HealthStudioScreen.routeName);
              },
              child: buildItem('Health Studio'),
            ),
            buildItem('Gym'),
            buildItem('Restaurants'),
            buildItem('Cafes'),
          ],
        ),
      ),
    );
  }

  Widget buildItem(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(10)),
      child: Row(
        children: [
          Icon(
            LineIcons.circle_o,
          ),
          SizedBox(
            width: getProportionateScreenWidth(10),
          ),
          Text(
            "$title",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(17),
            ),
          ),
        ],
      ),
    );
  }
}
