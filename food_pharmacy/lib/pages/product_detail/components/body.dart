import 'package:flutter/material.dart';
import 'package:foodpharmacy/components/colour.dart';
import 'package:foodpharmacy/media_config.dart';
import 'package:foodpharmacy/pages/home/components/image_slider.dart';
import 'package:foodpharmacy/responsive/size_config.dart';

import '../../cart_page.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSlider(),
              kOrderPlace(),
              kCartWishListButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget kOrderPlace() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
          child: Text(
            'Orders placed after this window might not be available',
            style: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 5,
              color: Colors.red,
            ),
          ),
        ),
        Text(
          'Vendor Info',
          style: TextStyle(
            fontSize: SizeConfig.safeBlockHorizontal * 5,
            color: Colors.green,
          ),
        ),
        Text(
          '\$115.00',
          style: TextStyle(
            fontSize: SizeConfig.safeBlockHorizontal * 5,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Quantity:     01',
              style: TextStyle(
                fontSize: SizeConfig.safeBlockHorizontal * 5,
                color: Colors.black,
              ),
            ),
            Text(
              'Size:     1ml',
              style: TextStyle(
                fontSize: SizeConfig.safeBlockHorizontal * 5,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget kCartWishListButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: getProportionateScreenWidth(140),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, CartPage.routeName);
              },
              style: ElevatedButton.styleFrom(
                primary: Colour.kPrimaryColor,
                elevation: 0.0,
              ),
              child: Text('Add to Cart'),
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(140),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colour.kPrimaryColor,
                elevation: 0.0,
              ),
              child: Text('Add to WishList'),
            ),
          ),
        ],
      ),
    );
  }
}
