import 'package:flutter/material.dart';
import 'package:foodpharmacy/media_config.dart';
import 'package:foodpharmacy/pages/login/components/login_form.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
          child: Column(
            children: [
              SizedBox(
                height: MediaConfig.screenWidth * 0.2,
              ),
              Container(
                height: MediaConfig.screenWidth * 0.2,
                width: MediaConfig.screenWidth,
                child: Image(
                  image: AssetImage('assets/images/logo.png'),
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
