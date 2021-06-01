import 'package:flutter/material.dart';
import 'package:foodpharmacy/models/registration/login.dart';
import 'package:foodpharmacy/pages/coaching/coaching_page.dart';
import 'package:foodpharmacy/pages/deposit_slip/deposit_slip_page.dart';
import 'package:foodpharmacy/pages/diet_plan/diet_plan_page.dart';
import 'package:foodpharmacy/pages/health_history/health_history_page.dart';
import 'package:foodpharmacy/pages/home/home_page.dart';
import 'package:foodpharmacy/pages/login/login_page.dart';
import 'package:foodpharmacy/pages/product_detail/product_detail_page.dart';
import 'package:foodpharmacy/pages/sign_up_page.dart';
import 'package:foodpharmacy/routes.dart';
import 'package:foodpharmacy/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Pharmacy',
      theme: theme(),
      initialRoute: LoginPage.routeName,
      routes: routes,
    );
  }
}
