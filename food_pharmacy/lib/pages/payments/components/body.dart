import 'package:flutter/material.dart';
import 'package:foodpharmacy/media_config.dart';
import 'package:foodpharmacy/pages/deposit_slip/deposit_slip_page.dart';
import 'package:line_icons/line_icons.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getProportionateScreenWidth(10),
            ),
            Text(
              'Payments :',
              style: TextStyle(
                color: Colors.green,
                fontSize: getProportionateScreenWidth(20),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(10),
            ),
            buildPaymentRow('Pay With Debit/Credit Card'),
            buildPaymentRow('Pay With Cash'),
            buildPaymentRow('Pay With Easy Paisa'),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, DepositSlipPage.routeName);
              },
              child: buildPaymentRow('Pay With Deposit Slip'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPaymentRow(String title) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                LineIcons.circle_o,
              ),
              SizedBox(
                width: getProportionateScreenWidth(10),
              ),
              Text(
                "$title",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          SizedBox(
            height: getProportionateScreenWidth(5),
          ),
        ],
      ),
    );
  }
}
