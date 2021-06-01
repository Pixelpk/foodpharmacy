import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodpharmacy/apis/api_client.dart';
import 'package:foodpharmacy/components/pref_manager.dart';
import 'package:foodpharmacy/components/progress_bar.dart';
import 'package:foodpharmacy/components/t.dart';
import 'package:foodpharmacy/models/coaching/deposit_slip.dart';
import 'package:foodpharmacy/models/coaching/select_amount.dart';
import '../../../media_config.dart';
import 'package:image_picker/image_picker.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String selectAmount = "1 Session (5,000)";
  var formKey = GlobalKey<FormState>();
  var depositSlip = DepositSlip();
  String base64Slip;
  String imageName;
  String userId, email, token;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    token = await PrefManager.getToken();
    userId = await PrefManager.getUserId();
    email = await PrefManager.getEmail();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getProportionateScreenWidth(10),
            ),
            Text(
              'DEPOSIT SLIP',
              style: TextStyle(
                color: Colors.green,
                fontSize: getProportionateScreenWidth(20),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(10),
            ),
            Text(
              'Name',
            ),
            SizedBox(
              height: getProportionateScreenWidth(5),
            ),
            buildNameForm(),
            SizedBox(
              height: getProportionateScreenWidth(10),
            ),
            SizedBox(
              height: getProportionateScreenWidth(10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Amount',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(15),
                      ),
                    ),
                  ],
                ),
                DropdownButton(
                  items: amountList.map((SelectAmount e) {
                    return DropdownMenuItem<String>(
                      value: e.amount,
                      child: Text(
                        e.amount,
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      ),
                    );
                  }).toList(),
                  hint: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(10)),
                    child: Text(
                      selectAmount,
                    ),
                  ),
                  onChanged: (val) {
                    setState(() {
                      selectAmount = val;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenWidth(10),
            ),
            ElevatedButton(
              onPressed: () {
                getBankSlip();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.grey,
                elevation: 0.0,
              ),
              child: Text('Choose File'),
            ),
            (imageName == null) ? Container() : Text(imageName),
            SizedBox(
              height: getProportionateScreenWidth(10),
            ),
            ElevatedButton(
              onPressed: () {
                validateAndDeposit();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                elevation: 0.0,
              ),
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNameForm() {
    return Form(
      key: formKey,
      child: TextFormField(
        onSaved: (value) => depositSlip.name = value,
        validator: (value) {
          if (value.isEmpty) {
            return '* Name required';
          }
          return null;
        },
        cursorColor: Colors.black,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(10),
              vertical: getProportionateScreenWidth(10)),
        ),
      ),
    );
  }

  Future getBankSlip() async {
    File imageSlip;
    dynamic _pickImageError;
    var picker = ImagePicker();
    try {
      final pickedFile = await picker.getImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        maxWidth: 200,
        maxHeight: 200,
      );
      setState(() {
        if (pickedFile != null) {
          setState(() {
            // print('path: ${pickedFile.path}');
            if (pickedFile.path.length >= 8) {
              imageName = pickedFile.path.substring(pickedFile.path.length - 8);
              // print(imageName);
              setState(() {});
            }
            imageSlip = File(pickedFile.path);
          });
        } else {
          print('No image selected.');
        }
      });

      List<int> imageBytes = imageSlip.readAsBytesSync();
      String result = base64Encode(imageBytes);

      setState(() {
        base64Slip = result;
        // print('aa: $base64Slip');
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
        print("ee: $_pickImageError");
      });
    }
  }

  void validateAndDeposit() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      depositSlip.userId = userId;
      depositSlip.email = email;
      depositSlip.amount = selectAmount;
      depositSlip.package = "live coaching";
      if (base64Slip == null) {
        T.message('bank slip required');
        return;
      }
      depositSlip.paymentSlip = base64Slip;
      print('${depositSlip.name}  $userId $email $selectAmount $base64Slip');
      ProgressBar.indicator.show(context);
      ApiClient.apiClient.depositSlipApi(depositSlip, token).then((value) {
        ProgressBar.indicator.hide();
        if (value != null && value.response != null) {
          T.message(value.response);
          Navigator.pop(context);
        }
      }).catchError((e) {
        ProgressBar.indicator.hide();
        T.message(e.toString());
      });
    }
  }
}
