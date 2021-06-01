import 'package:flutter/material.dart';
import 'package:foodpharmacy/components/colour.dart';
import 'health_form.dart';

import '../../../media_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool checkImmunity = false;
  bool checkAcidity = false;
  bool checkConstipation = false;
  bool checkDia = false;
  bool checkLeaky = false;
  bool checkDiagnosed = false;
  bool checkAuto = false;
  bool checkFood = false;
  bool checkInsulin = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: getProportionateScreenWidth(5),
                  ),
                  Text(
                    'HEALTH HISTORY FORM',
                    style: TextStyle(
                      color: Colour.kPrimaryColor,
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenWidth(10),
                  ),
                  Text(
                    'Health History for Female/Male for Gut Health targeting problems including:',
                  ),
                ],
              ),
            ),
            // step 1
            // SizedBox(
            //   height: getProportionateScreenWidth(40),
            //   child: CheckboxListTile(
            //     title: Text('Poor Immunity'),
            //     controlAffinity: ListTileControlAffinity.leading,
            //     activeColor: Colour.kPrimaryColor,
            //     value: checkImmunity,
            //     contentPadding: EdgeInsets.all(0),
            //     onChanged: (bool value) {
            //       setState(() {
            //         checkImmunity = value;
            //       });
            //     },
            //   ),
            // ),
            // SizedBox(
            //   height: getProportionateScreenWidth(40),
            //   child: CheckboxListTile(
            //     title: Text('Acidity'),
            //     controlAffinity: ListTileControlAffinity.leading,
            //     activeColor: Colour.kPrimaryColor,
            //     value: checkAcidity,
            //     contentPadding: EdgeInsets.all(0),
            //     onChanged: (bool value) {
            //       setState(() {
            //         checkAcidity = value;
            //       });
            //     },
            //   ),
            // ),
            // SizedBox(
            //   height: getProportionateScreenWidth(40),
            //   child: CheckboxListTile(
            //     title: Text('Constipation'),
            //     controlAffinity: ListTileControlAffinity.leading,
            //     activeColor: Colour.kPrimaryColor,
            //     value: checkConstipation,
            //     contentPadding: EdgeInsets.all(0),
            //     onChanged: (bool value) {
            //       setState(() {
            //         checkConstipation = value;
            //       });
            //     },
            //   ),
            // ),
            // // step 2
            // SizedBox(
            //   height: getProportionateScreenWidth(40),
            //   child: CheckboxListTile(
            //     title: Text('Diarrhoea'),
            //     controlAffinity: ListTileControlAffinity.leading,
            //     activeColor: Colour.kPrimaryColor,
            //     value: checkDia,
            //     contentPadding: EdgeInsets.all(0),
            //     onChanged: (bool value) {
            //       setState(() {
            //         checkDia = value;
            //       });
            //     },
            //   ),
            // ),
            // SizedBox(
            //   height: getProportionateScreenWidth(40),
            //   child: CheckboxListTile(
            //     title: Text('Leaky Gut with is the precursor to'),
            //     controlAffinity: ListTileControlAffinity.leading,
            //     activeColor: Colour.kPrimaryColor,
            //     value: checkLeaky,
            //     contentPadding: EdgeInsets.all(0),
            //     onChanged: (bool value) {
            //       setState(() {
            //         checkLeaky = value;
            //       });
            //     },
            //   ),
            // ),
            // SizedBox(
            //   height: getProportionateScreenWidth(40),
            //   child: CheckboxListTile(
            //     title: Text('Diagnosed IBS'),
            //     controlAffinity: ListTileControlAffinity.leading,
            //     activeColor: Colour.kPrimaryColor,
            //     value: checkDiagnosed,
            //     contentPadding: EdgeInsets.all(0),
            //     onChanged: (bool value) {
            //       setState(() {
            //         checkDiagnosed = value;
            //       });
            //     },
            //   ),
            // ),
            // // step 3
            // SizedBox(
            //   height: getProportionateScreenWidth(40),
            //   child: CheckboxListTile(
            //     title: Text('Auto-Immune diseases'),
            //     controlAffinity: ListTileControlAffinity.leading,
            //     activeColor: Colour.kPrimaryColor,
            //     value: checkAuto,
            //     contentPadding: EdgeInsets.all(0),
            //     onChanged: (bool value) {
            //       setState(() {
            //         checkAuto = value;
            //       });
            //     },
            //   ),
            // ),
            // SizedBox(
            //   height: getProportionateScreenWidth(40),
            //   child: CheckboxListTile(
            //     title: Text('Food allergies and intolerance'),
            //     controlAffinity: ListTileControlAffinity.leading,
            //     activeColor: Colour.kPrimaryColor,
            //     value: checkFood,
            //     contentPadding: EdgeInsets.all(0),
            //     onChanged: (bool value) {
            //       setState(() {
            //         checkFood = value;
            //       });
            //     },
            //   ),
            // ),
            // SizedBox(
            //   height: getProportionateScreenWidth(40),
            //   child: CheckboxListTile(
            //     title: Text('Insulin resistance'),
            //     controlAffinity: ListTileControlAffinity.leading,
            //     activeColor: Colour.kPrimaryColor,
            //     value: checkInsulin,
            //     contentPadding: EdgeInsets.all(0),
            //     onChanged: (bool value) {
            //       setState(() {
            //         checkInsulin = value;
            //       });
            //     },
            //   ),
            // ),
            // SizedBox(
            //   height: getProportionateScreenWidth(15),
            // ),
            HealthFrom(),
          ],
        ),
      ),
    );
  }

  Widget go() {
    return ElevatedButton(
      onPressed: () {
        print('$checkImmunity $checkAcidity $checkConstipation');
        print('$checkDia $checkLeaky $checkDiagnosed');
        print('$checkAuto $checkFood $checkInsulin');
      },
      child: Text('Go'),
    );
  }
}
