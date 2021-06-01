import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodpharmacy/components/custom_nav_drawer.dart';
import 'package:foodpharmacy/components/custom_pop_menu.dart';
import 'package:foodpharmacy/pages/add_address/add_address_page.dart';
import '../responsive/size_config.dart';

class ShowAddressPage extends StatefulWidget {
  static String routeName = "/show_address_page";
  @override
  _ShowAddressPageState createState() => _ShowAddressPageState();
}

class _ShowAddressPageState extends State<ShowAddressPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            actions: [
              CustomPopMenu(),
            ],
          ),
          drawer: CustomNavDrawer(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ListView(
              children: [
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 2,
                ),
                customListAddress(),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 2,
                ),
                customListAddress(),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 2,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        Navigator.pushNamed(context, AddAddressPage.routeName);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        elevation: 0.0,
                      ),
                      child: Text('Add New Address'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customShowAddress(String title, String subTitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 5,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subTitle,
            style: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 5,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget customListAddress() {
    return Card(
      shape: Border.all(
        color: Colors.grey,
      ),
      elevation: 0.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: SizeConfig.safeBlockVertical * 2,
          ),
          customShowAddress(
            'Name',
            'John Doe',
          ),
          SizedBox(
            height: SizeConfig.safeBlockVertical * 2,
          ),
          customShowAddress(
            'Phone',
            '+1 23 456789',
          ),
          SizedBox(
            height: SizeConfig.safeBlockVertical * 2,
          ),
          customShowAddress(
            'Address',
            'Pixel pk technologies',
          ),
          SizedBox(
            height: SizeConfig.safeBlockVertical * 2,
          ),
          Container(
            height: SizeConfig.safeBlockVertical * 6,
            color: Colors.green,
            child: Center(
              child: Text(
                'Use This Address',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
