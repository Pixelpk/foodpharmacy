import 'package:flutter/material.dart';
import 'package:foodpharmacy/components/custom_nav_drawer.dart';
import 'package:foodpharmacy/components/custom_pop_menu.dart';
import 'package:foodpharmacy/media_config.dart';
import 'components/body.dart';

class DietPlanPage extends StatefulWidget {
  static String routeName = "diet_plan";

  @override
  _DietPlanPageState createState() => _DietPlanPageState();
}

class _DietPlanPageState extends State<DietPlanPage> {
  @override
  Widget build(BuildContext context) {
    MediaConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          CustomPopMenu(),
        ],
      ),
      drawer: CustomNavDrawer(),
      body: Body(),
    );
  }
}
