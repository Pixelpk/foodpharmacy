import 'package:flutter/material.dart';
import 'package:foodpharmacy/media_config.dart';
import 'components/body.dart';

class LoginPage extends StatefulWidget {
  static String routeName = "/login_page";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    MediaConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
