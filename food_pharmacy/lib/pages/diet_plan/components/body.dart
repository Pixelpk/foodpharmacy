import 'package:flutter/material.dart';
import 'package:foodpharmacy/apis/api_client.dart';
import 'package:foodpharmacy/components/colour.dart';
import 'package:foodpharmacy/media_config.dart';
import 'package:foodpharmacy/models/coaching/diet_plan.dart';
import 'package:foodpharmacy/pages/diet_plan/components/day_meal.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  DateTime currentDate = DateTime.now();
  Future<DietPlan> futureDietPlan;

  @override
  void initState() {
    super.initState();
    futureDietPlan = ApiClient.apiClient.dietPlanApi();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'View Diet Plan',
              style: TextStyle(
                color: Colour.kPrimaryColor,
                fontSize: getProportionateScreenWidth(20),
              ),
            ),
            Text(
              'Meal Plan',
              style: TextStyle(
                color: Colors.black,
                fontSize: getProportionateScreenWidth(20),
              ),
            ),
            Text(
              '${currentDate.toLocal()}'.split(' ')[0],
              style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(12)),
            ),
            Text(
              'A health eating plan: Emphasizes vegetables, fruits, whole grains and fat-free or low-fat dairy products. Includes lean meats, poultry, fish, beans, eggs and nuts. Limits saturated and trans fats, sodium and added sugars.',
              style: TextStyle(fontSize: getProportionateScreenWidth(10)),
            ),
            SizedBox(
              height: getProportionateScreenWidth(10),
            ),
            Expanded(
              child: FutureBuilder<DietPlan>(
                future: futureDietPlan,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.data == null) {
                    return showMessage('Data not found');
                  } else if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.data != null &&
                      snapshot.data.response.message
                          .contains('No Diet Plan Assigned')) {
                    return showMessage(
                        'No Diet Plan Assigned Till Now, Please Wait');
                  } else if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.data != null) {
                    return kDietListView(snapshot.data);
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error);
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
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

  Widget kDietListView(DietPlan dietPlan) {
    return ListView.builder(
      itemCount: dietPlan.response.sunday.breakfast.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            DayMeal(dietPlan: dietPlan, index: index),
          ],
        );
      },
    );
  }
}
