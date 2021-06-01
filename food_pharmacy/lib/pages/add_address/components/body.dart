import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodpharmacy/pages/add_address/components/add_address_form.dart';

import '../../../media_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: getProportionateScreenHeight(10)),
                Text(
                  'Add Address',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: getProportionateScreenWidth(20),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AddAddressForm(),
                SizedBox(height: getProportionateScreenHeight(10)),
                ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    elevation: 0.0,
                  ),
                  child: Text('Save Address'),
                ),
                SizedBox(height: getProportionateScreenHeight(5)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
