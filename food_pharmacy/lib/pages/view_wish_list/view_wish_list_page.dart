import 'package:flutter/material.dart';
import 'package:foodpharmacy/components/custom_nav_drawer.dart';
import 'package:foodpharmacy/components/custom_pop_menu.dart';
import 'components/body.dart';
import 'package:foodpharmacy/responsive/size_config.dart';

class ViewWishListPage extends StatelessWidget {
  static String routeName = "/view_wish_list";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
