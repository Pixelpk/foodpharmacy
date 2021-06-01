import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:foodpharmacy/apis/api_client.dart';
import 'package:foodpharmacy/components/colour.dart';
import 'package:foodpharmacy/components/pref_manager.dart';
import 'package:foodpharmacy/components/progress_bar.dart';
import 'package:foodpharmacy/components/t.dart';
import 'package:foodpharmacy/media_config.dart';
import 'package:foodpharmacy/models/registration/login.dart';
import 'package:foodpharmacy/pages/coaching/coaching_page.dart';
import 'package:line_icons/line_icons.dart';

import '../../forgot_password_page.dart';
import '../../sign_up_page.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var formKey = GlobalKey<FormState>();
  var login = Login();
  bool rememberMe = false;
  String emailError, passError;
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                onSaved: (value) => login.email = value.toString().trim(),
                onChanged: (value) {
                  if (emailError != null) {
                    emailError = "";
                    setState(() {});
                  }
                },
                validator: (value) {
                  if (!EmailValidator.validate(value.toString().trim())) {
                    return '* Valid email required';
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
                    color: Colors.black,
                  ),
                  hintText: 'Email *',
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              (emailError == null)
                  ? Container()
                  : Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        emailError,
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
              TextFormField(
                onSaved: (value) => login.password = value.toString().trim(),
                onChanged: (value) {
                  if (passError != null) {
                    passError = "";
                    setState(() {});
                  }
                },
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
                obscureText: obscure,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock_outline_rounded,
                    color: Colors.black,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                    icon: Icon(
                      (obscure == true) ? LineIcons.eye_slash : LineIcons.eye,
                      color: Colors.black,
                    ),
                  ),
                  hintText: 'Password *',
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              (passError == null)
                  ? Container()
                  : Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        passError,
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
              SizedBox(
                height: getProportionateScreenWidth(2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: rememberMe,
                        onChanged: _onRememberMeChanged,
                        activeColor: Colors.green,
                      ),
                      Text(
                        'Remember Me',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPasswordPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Forgot Password ?',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenWidth(2),
              ),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              validateAndLogin();
            },
            style: ElevatedButton.styleFrom(
              primary: Colour.kPrimaryColor,
              elevation: 0.0,
            ),
            child: Text('LOGIN'),
          ),
        ),
        Center(
          child: Text(
            'OR',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUpPage(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Colour.kPrimaryColor,
              elevation: 0.0,
            ),
            child: Text('SIGN UP'),
          ),
        ),
        SizedBox(
          height: getProportionateScreenWidth(3),
        ),
        Center(
          child: Text(
            'Login With',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: getProportionateScreenWidth(1),
        ),
        GoogleSignInButton(
          onPressed: () {},
          darkMode: true,
        ),
        SizedBox(
          height: getProportionateScreenWidth(1),
        ),
        FacebookSignInButton(
          onPressed: () {},
        ),
      ],
    );
  }

  void _onRememberMeChanged(bool newValue) => setState(() {
        rememberMe = newValue;
        if (rememberMe) {
          // TODO: Here goes your functionality that remembers the user.
        } else {
          // TODO: Forget the user
        }
      });

  void validateAndLogin() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      ProgressBar.indicator.show(context);
      ApiClient.apiClient.loginApi(login).then((value) async {
        ProgressBar.indicator.hide();
        print(value.status);
        if (value.status == "okay" &&
            value.response.jwt != null &&
            value.user.email != null) {
          T.message(value.response.message);
          PrefManager.setToken(value.response.jwt);
          PrefManager.setUserId(value.user.id);
          PrefManager.setName(value.user.name);
          PrefManager.setEmail(value.user.email);
          Navigator.pushNamed(context, CoachingPage.routeName);
        } else if (value.status == "fail") {
          if (value.response.message.contains('email')) {
            if (passError != null) {
              passError = "";
            }
            emailError = value.response.message;
          } else if (value.response.message.contains('password')) {
            if (emailError != null) {
              emailError = "";
            }
            passError = value.response.message;
          }
          setState(() {});
        }
      }).catchError((e) {
        ProgressBar.indicator.hide();
        print(e.toString());
      });
    }
  }
}
