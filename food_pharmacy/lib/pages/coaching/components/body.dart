import 'package:flutter/material.dart';
import 'package:foodpharmacy/apis/api_client.dart';
import 'package:foodpharmacy/components/colour.dart';
import 'package:foodpharmacy/components/t.dart';
import 'package:foodpharmacy/media_config.dart';
import 'package:foodpharmacy/models/coaching/payment_status.dart';
import 'package:foodpharmacy/pages/coaching/ScheduleMeeting.dart';
import 'package:foodpharmacy/pages/coaching/components/coaching_plan_page.dart';
import 'package:foodpharmacy/pages/diet_plan/diet_plan_page.dart';
import 'package:foodpharmacy/pages/health_history/health_history_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<PaymentStatus> futurePaymentStatus;

  @override
  void initState() {
    super.initState();
    futurePaymentStatus = ApiClient.apiClient.paymentStatusApi();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<PaymentStatus>(
        future: futurePaymentStatus,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data == null) {
            return showMessage('Data not found');
          } else if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data != null) {
            return kView(snapshot.data);
          } else if (snapshot.hasError) {
            return Text(snapshot.error);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget showMessage(String title) {
    return Container(
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(20),
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  Widget kView(PaymentStatus paymentStatus) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
      child: Column(
        children: [
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          Container(
            height: getProportionateScreenWidth(40),
            color: Colour.kLightBox,
            child: Center(
              child: Text(
                (paymentStatus.response.status.contains('pending'))
                    ? 'Your payment is under review'
                    : 'Please wait create payment first',
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Coaching',
                style: TextStyle(color: Colors.green),
              ),
              SizedBox(
                height: getProportionateScreenWidth(25),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, CoachingPlanPage.routeName);
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  child: Text(
                    'Create',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
              onTap: () =>
                  (paymentStatus.response.status.contains('cant find such') ||
                          paymentStatus.response.status.contains('pending'))
                      ? T.message('create payment first')
                      : Navigator.pushNamed(
                          context, ScheduleMeetingScreen.routeName),
              child: kCoachingModules(
                  'assets/images/schedule.svg', 'SCHEDULE', paymentStatus)),
          GestureDetector(
            onTap: () {
              (paymentStatus.response.status.contains('cant find such') ||
                      paymentStatus.response.status.contains('pending'))
                  ? T.message('create payment first')
                  : Navigator.pushNamed(context, HealthHistoryPage.routeName);
            },
            child: kCoachingModules('assets/images/health_history.svg',
                'HEALTH HISTORY', paymentStatus),
          ),
          GestureDetector(
            onTap: () {
              (paymentStatus.response.status.contains('cant find such') ||
                      paymentStatus.response.status.contains('pending'))
                  ? T.message('create payment first')
                  : Navigator.pushNamed(context, DietPlanPage.routeName);
            },
            child: kCoachingModules(
                'assets/images/diet_plan.svg', 'DIET PLAN', paymentStatus),
          ),
        ],
      ),
    );
  }

  Widget kCoachingModules(
      String url, String title, PaymentStatus paymentStatus) {
    return Column(
      children: [
        SizedBox(
          height: getProportionateScreenWidth(30),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              url,
              height: getProportionateScreenWidth(60),
            ),
            Container(
              height: getProportionateScreenWidth(25),
              width: MediaConfig.screenWidth * 0.35,
              decoration: BoxDecoration(
                color:
                    (paymentStatus.response.status.contains('cant find such') ||
                            paymentStatus.response.status.contains('pending'))
                        ? Colour.kLightBox
                        : Colors.white,
                border: Border.all(
                    color: (paymentStatus.response.status
                                .contains('cant find such') ||
                            paymentStatus.response.status.contains('pending'))
                        ? Colors.green
                        : Colour.kPrimaryColor),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: (paymentStatus.response.status
                                  .contains('cant find such') ||
                              paymentStatus.response.status.contains('pending'))
                          ? Colors.grey
                          : Colors.black,
                      fontSize: getProportionateScreenWidth(10),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
