import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodpharmacy/components/custom_nav_drawer.dart';
import 'package:foodpharmacy/components/custom_pop_menu.dart';
import '../models/registration/select_city.dart';
import '../responsive/size_config.dart';

class EditProfilePage extends StatefulWidget {
  static String routeName = "/edit_profile_page";

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final formKey = GlobalKey<FormState>();
  String selectCity = "Dublin";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          CustomPopMenu(),
        ],
      ),
      drawer: CustomNavDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: SizeConfig.safeBlockVertical*2,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Edit Profile',
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 5,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 4,
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return '* Name required';
                      }
                      return null;
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person_outline,
                        size: SizeConfig.safeBlockHorizontal * 7,
                        color: Colors.black,
                      ),
                      hintText: 'Name *',
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      isDense: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return '* Email required';
                      }
                      return null;
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        size: SizeConfig.safeBlockHorizontal * 7,
                        color: Colors.black,
                      ),
                      hintText: 'Email *',
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      isDense: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return '* Password required';
                      }
                      return null;
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                        size: SizeConfig.safeBlockHorizontal * 7,
                        color: Colors.black,
                      ),
                      hintText: 'Password *',
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      isDense: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return '* Phone number required';
                      }
                      return null;
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.phone,
                        size: SizeConfig.safeBlockHorizontal * 7,
                        color: Colors.black,
                      ),
                      hintText: 'Phone No *',
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      isDense: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.apartment_sharp,
                            size: SizeConfig.safeBlockHorizontal * 7,
                          ),
                          SizedBox(
                            width: SizeConfig.blockSizeVertical * 2,
                          ),
                          Text(
                            'Select city',
                            style: TextStyle(
                              fontSize: SizeConfig.blockSizeVertical * 2,
                            ),
                          ),
                        ],
                      ),
                      DropdownButton(
                        items: cityList.map((SelectCity e) {
                          return DropdownMenuItem<String>(
                            value: e.city,
                            child: Text(
                              e.city,
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                          );
                        }).toList(),
                        hint: Text(
                          selectCity,
                        ),
                        onChanged: (val) {
                          setState(() {
                            selectCity = val;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: SizeConfig.safeBlockVertical * 6,
                width: SizeConfig.screenWidth,
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: Center(
                  child: Text(
                    'UPDATE',
                    style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 5,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
