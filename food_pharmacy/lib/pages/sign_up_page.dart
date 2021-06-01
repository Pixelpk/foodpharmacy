import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../apis/api_client.dart';
import '../components/progress_bar.dart';
import '../components/t.dart';
import '../media_config.dart';
import '../models/registration/sign_up.dart';
import '../models/registration/select_city.dart';
import '../responsive/size_config.dart';
import 'package:email_validator/email_validator.dart';

class SignUpPage extends StatefulWidget {
  static String routeName = "/sign_up_page";

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var formKey = GlobalKey<FormState>();
  String selectCity = "Dublin";
  var signUp = SignUp();
  String error;
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    MediaConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              height: SizeConfig.safeBlockVertical * 15,
              width: SizeConfig.screenWidth,
              child: Image(
                image: AssetImage('assets/images/logo.png'),
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 4,
            ),
            Column(
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        onSaved: (value) =>
                            signUp.name = value.toString().trim(),
                        validator: (value) {
                          if (value.isEmpty || value.length < 3) {
                            return '* Name at least 3 characters';
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
                        onSaved: (value) =>
                            signUp.email = value.toString().trim(),
                        validator: (value) {
                          if (!EmailValidator.validate(
                              value.toString().trim())) {
                            return 'Valid email required';
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
                        onSaved: (value) =>
                            signUp.password = value.toString().trim(),
                        validator: (value) {
                          if (value.isEmpty || value.length < 6) {
                            return '* Password at least 6 characters';
                          }
                          return null;
                        },
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        cursorColor: Colors.black,
                        obscureText: obscure,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock_outline_rounded,
                            size: SizeConfig.safeBlockHorizontal * 7,
                            color: Colors.black,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                obscure = !obscure;
                              });
                            },
                            icon: Icon(
                              (obscure == true)
                                  ? LineIcons.eye_slash
                                  : LineIcons.eye,
                              color: Colors.black,
                            ),
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
                        onSaved: (value) =>
                            signUp.phone = value.toString().trim(),
                        validator: (value) {
                          if (value.isEmpty || value.length < 11) {
                            return '* Phone at least 11 characters';
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
                      kGenderSection(),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 2,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    validateAndSignUp();
                  },
                  child: Container(
                    height: SizeConfig.safeBlockVertical * 6,
                    width: SizeConfig.screenWidth,
                    decoration: BoxDecoration(
                      color: Colors.green,
                    ),
                    child: Center(
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 5,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 2,
                ),
                (error == null)
                    ? Container()
                    : Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          error,
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void validateAndSignUp() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      signUp.city = selectCity;
      ProgressBar.indicator.show(context);
      ApiClient.apiClient.signUpApi(signUp).then((value) {
        ProgressBar.indicator.hide();
        if (value.status == "okay") {
          if (error != null) {
            error = "";
            setState(() {});
          }
          T.message(value.response.message);
          Navigator.pop(context);
        } else if (value.status == "fail") {
          error = value.response.message;
          setState(() {});
        }
      }).catchError((e) {
        ProgressBar.indicator.hide();
        T.message('Duplicate entry for email or phone');
        print(e.toString());
      });
    }
  }

  Widget kGenderSection() {
    return Container(
      height: getProportionateScreenWidth(45),
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(5.0)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(5)),
        child: Row(
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
                  signUp.city = selectCity;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
