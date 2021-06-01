import 'package:flutter/material.dart';

import '../../../media_config.dart';

class AddAddressForm extends StatefulWidget {
  @override
  _AddAddressFormState createState() => _AddAddressFormState();
}

class _AddAddressFormState extends State<AddAddressForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildText('First Name *'),
        buildFNameFormField(),
        buildText('Last Name *'),
        buildFNameFormField(),
        buildText('Email *'),
        buildFNameFormField(),
        buildText('Phone No *'),
        buildFNameFormField(),
        buildText('Address *'),
        buildFNameFormField(),
        buildText('Zip Code *'),
        buildFNameFormField(),
        buildText('Country *'),
        buildFNameFormField(),
        buildText('State *'),
        buildFNameFormField(),
        buildText('City *'),
        buildFNameFormField(),
      ],
    );
  }

  TextFormField buildFNameFormField() {
    return TextFormField(
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  Column buildText(String title){
    return Column(
      children: [
        SizedBox(height: getProportionateScreenHeight(10)),
        Text(
          title,
        ),
      ],
    );
  }
}
