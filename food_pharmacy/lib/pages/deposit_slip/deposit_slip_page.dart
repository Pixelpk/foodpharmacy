import 'package:flutter/material.dart';
import 'package:foodpharmacy/components/custom_nav_drawer.dart';
import 'package:foodpharmacy/components/custom_pop_menu.dart';
import 'package:foodpharmacy/media_config.dart';
import 'components/body.dart';

class DepositSlipPage extends StatelessWidget {
  static String routeName = "deposit_slip";

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
