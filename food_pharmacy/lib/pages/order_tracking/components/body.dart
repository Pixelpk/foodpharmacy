import 'package:flutter/material.dart';

import '../../../media_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: getProportionateScreenWidth(10),
            ),
            Text(
              'Order Tracking',
              style: TextStyle(
                color: Colors.green,
                fontSize: getProportionateScreenWidth(20),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(30),
            ),
            Text(
              'Order ID *',
              style: TextStyle(
                fontSize: getProportionateScreenWidth(20),
              ),
            ),
            TextFormField(
              style: TextStyle(
                color: Colors.black,
              ),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
                isDense: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  child: Text(
                    'Search',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
