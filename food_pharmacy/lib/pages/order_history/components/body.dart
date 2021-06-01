import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodpharmacy/media_config.dart';
import 'order_history_view.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getProportionateScreenWidth(10),
            ),
            Text(
              'Orders',
              style: TextStyle(
                color: Colors.green,
                fontSize: getProportionateScreenWidth(20),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(10),
            ),
            TextFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                hintText: 'Order Id',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.green,
                ),
              ),
            ),
            OrderHistoryView(),
          ],
        ),
      ),
    );
  }
}
