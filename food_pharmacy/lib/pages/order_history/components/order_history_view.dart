import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodpharmacy/media_config.dart';

class OrderHistoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenWidth(10)),
              child: Container(
                height: MediaConfig.screenWidth * 0.2,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildOrderItem('ID', '5748'),
                    buildOrderItem('Date', '12-03-2020'),
                    buildOrderItem('Status', 'Shipped'),
                    buildOrderItem('Amount', '12000 PKR'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildOrderItem(String title, String data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(data),
      ],
    );
  }
}
