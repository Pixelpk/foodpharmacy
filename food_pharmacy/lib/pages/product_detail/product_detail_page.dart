import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodpharmacy/components/custom_nav_drawer.dart';
import 'package:foodpharmacy/components/custom_pop_menu.dart';
import 'package:foodpharmacy/media_config.dart';
import 'package:foodpharmacy/responsive/size_config.dart';
import 'components/body.dart';

class ProductDetailPage extends StatelessWidget {
  static String routeName = "/product_detail_page";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
