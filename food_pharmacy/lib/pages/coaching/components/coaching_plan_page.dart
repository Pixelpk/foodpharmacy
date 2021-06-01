import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodpharmacy/components/colour.dart';
import 'package:foodpharmacy/components/custom_nav_drawer.dart';
import 'package:foodpharmacy/components/custom_pop_menu.dart';
import 'package:foodpharmacy/components/t.dart';
import 'package:foodpharmacy/pages/deposit_slip/deposit_slip_page.dart';
import 'package:foodpharmacy/responsive/size_config.dart';

import '../../../media_config.dart';

class CoachingPlanPage extends StatefulWidget {
  static String routeName = "coaching_plan";

  @override
  _CoachingPlanPageState createState() => _CoachingPlanPageState();
}

class _CoachingPlanPageState extends State<CoachingPlanPage> {
  @override
  Widget build(BuildContext context) {
    MediaConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          CustomPopMenu(),
        ],
      ),
      drawer: CustomNavDrawer(),
      body: buildView(),
    );
  }

  Widget buildView() {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
            Container(
              height: getProportionateScreenWidth(70),
              color: Colour.kLightBox,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15)),
                child: Center(
                  child: Text(
                    'Physical coaching not available for now due to current pandemic.Thank you',
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Live Coaching'),
                            Stack(
                              children: [
                                Image(
                                  height: MediaConfig.screenHeight * 0.6,
                                  image: AssetImage(
                                    'assets/images/live_coach.png',
                                  ),
                                ),
                                Positioned(
                                  bottom: getProportionateScreenWidth(90),
                                  left: getProportionateScreenWidth(45),
                                  child: SizedBox(
                                    height: getProportionateScreenWidth(30),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, DepositSlipPage.routeName);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        elevation: 0.0,
                                      ),
                                      child: Text(
                                        'SUBMIT',
                                        style: TextStyle(
                                            color: Colour.kPrimaryColor),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(10),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Physical Coaching'),
                            Stack(
                              children: [
                                Image(
                                  height: MediaConfig.screenHeight * 0.6,
                                  image: AssetImage(
                                    'assets/images/physical_coach.png',
                                  ),
                                ),
                                Positioned(
                                  bottom: getProportionateScreenWidth(90),
                                  left: getProportionateScreenWidth(45),
                                  child: SizedBox(
                                    height: getProportionateScreenWidth(30),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        T.message('not available during pandemic');
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        elevation: 0.0,
                                      ),
                                      child: Text(
                                        'SUBMIT',
                                        style: TextStyle(
                                            color: Colour.kPrimaryColor),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
