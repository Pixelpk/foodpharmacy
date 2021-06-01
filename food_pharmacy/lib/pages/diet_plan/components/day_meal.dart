import 'package:flutter/material.dart';
import 'package:foodpharmacy/components/colour.dart';
import 'package:foodpharmacy/models/coaching/diet_plan.dart';

import '../../../media_config.dart';

class DayMeal extends StatelessWidget {
  final DietPlan dietPlan;
  final int index;

  const DayMeal({this.dietPlan, this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kSundayMeal(),
        kMondayMeal(),
        kTuesdayMeal(),
        kWednesdayMeal(),
        kThursdayMeal(),
        kFridayMeal(),
        kSaturdayMeal(),
      ],
    );
  }

  //sunday meal
  Widget kSundayMeal() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sunday',
          style: TextStyle(
            color: Colour.kPrimaryColor,
            fontWeight: FontWeight.bold,
            fontSize: getProportionateScreenWidth(20),
          ),
        ),
        //breakfast
        kMealTime('BreakFast'),
        kItem(
            'Item 1',
            dietPlan.response.sunday.breakfast[index].item ??
                "not assigned yet"),
        kItem(
            'View Recipe Direction',
            dietPlan.response.sunday.breakfast[index].recipe ??
                "not assigned yet"),
        kItem(
            'View Grocery List',
            dietPlan.response.sunday.breakfast[index].grocery ??
                "not assigned yet"),
        //lunch
        kMealTime('Lunch'),
        kItem('Item 1',
            dietPlan.response.sunday.lunch[index].item ?? "not assigned yet"),
        kItem('View Recipe Direction',
            dietPlan.response.sunday.lunch[index].recipe ?? "not assigned yet"),
        kItem(
            'View Grocery List',
            dietPlan.response.sunday.lunch[index].grocery ??
                "not assigned yet"),
        //snack
        kMealTime('Snack'),
        kItem('Item 1',
            dietPlan.response.sunday.snacks[index].item ?? "not assigned yet"),
        kItem(
            'View Recipe Direction',
            dietPlan.response.sunday.snacks[index].recipe ??
                "not assigned yet"),
        kItem(
            'View Grocery List',
            dietPlan.response.sunday.snacks[index].grocery ??
                "not assigned yet"),
        //dinner
        kMealTime('Dinner'),
        kItem('Item 1',
            dietPlan.response.sunday.dinner[index].item ?? "not assigned yet"),
        kItem(
            'View Recipe Direction',
            dietPlan.response.sunday.dinner[index].recipe ??
                "not assigned yet"),
        kItem(
            'View Grocery List',
            dietPlan.response.sunday.dinner[index].grocery ??
                "not assigned yet"),
      ],
    );
  }

  //monday meal
  Widget kMondayMeal() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Monday',
          style: TextStyle(
            color: Colour.kPrimaryColor,
            fontWeight: FontWeight.bold,
            fontSize: getProportionateScreenWidth(20),
          ),
        ),
        //breakfast
        kMealTime('BreakFast'),
        kItem(
            'Item 1',
            dietPlan.response.monday.breakfast[index].item ??
                "not assigned yet"),
        kItem(
            'View Recipe Direction',
            dietPlan.response.monday.breakfast[index].recipe ??
                "not assigned yet"),
        kItem(
            'View Grocery List',
            dietPlan.response.monday.breakfast[index].grocery ??
                "not assigned yet"),
        //lunch
        kMealTime('Lunch'),
        kItem('Item 1',
            dietPlan.response.monday.lunch[index].item ?? "not assigned yet"),
        kItem('View Recipe Direction',
            dietPlan.response.monday.lunch[index].recipe ?? "not assigned yet"),
        kItem(
            'View Grocery List',
            dietPlan.response.monday.lunch[index].grocery ??
                "not assigned yet"),
        //snack
        kMealTime('Snack'),
        kItem('Item 1',
            dietPlan.response.monday.snacks[index].item ?? "not assigned yet"),
        kItem(
            'View Recipe Direction',
            dietPlan.response.monday.snacks[index].recipe ??
                "not assigned yet"),
        kItem(
            'View Grocery List',
            dietPlan.response.monday.snacks[index].grocery ??
                "not assigned yet"),
        //dinner
        kMealTime('Dinner'),
        kItem('Item 1',
            dietPlan.response.monday.dinner[index].item ?? "not assigned yet"),
        kItem(
            'View Recipe Direction',
            dietPlan.response.monday.dinner[index].recipe ??
                "not assigned yet"),
        kItem(
            'View Grocery List',
            dietPlan.response.monday.dinner[index].grocery ??
                "not assigned yet"),
      ],
    );
  }

  //tuesday meal
  Widget kTuesdayMeal() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tuesday',
          style: TextStyle(
            color: Colour.kPrimaryColor,
            fontWeight: FontWeight.bold,
            fontSize: getProportionateScreenWidth(20),
          ),
        ),
        //breakfast
        kMealTime('BreakFast'),
        kItem(
            'Item 1',
            dietPlan.response.tuesday.breakfast[index].item ??
                "not assigned yet"),
        kItem(
            'View Recipe Direction',
            dietPlan.response.tuesday.breakfast[index].recipe ??
                "not assigned yet"),
        kItem(
            'View Grocery List',
            dietPlan.response.tuesday.breakfast[index].grocery ??
                "not assigned yet"),
        //lunch
        kMealTime('Lunch'),
        kItem('Item 1',
            dietPlan.response.tuesday.lunch[index].item ?? "not assigned yet"),
        kItem(
            'View Recipe Direction',
            dietPlan.response.tuesday.lunch[index].recipe ??
                "not assigned yet"),
        kItem(
            'View Grocery List',
            dietPlan.response.tuesday.lunch[index].grocery ??
                "not assigned yet"),
        //snack
        kMealTime('Snack'),
        kItem('Item 1',
            dietPlan.response.tuesday.snacks[index].item ?? "not assigned yet"),
        kItem(
            'View Recipe Direction',
            dietPlan.response.tuesday.snacks[index].recipe ??
                "not assigned yet"),
        kItem(
            'View Grocery List',
            dietPlan.response.tuesday.snacks[index].grocery ??
                "not assigned yet"),
        //dinner
        kMealTime('Dinner'),
        kItem('Item 1',
            dietPlan.response.tuesday.dinner[index].item ?? "not assigned yet"),
        kItem(
            'View Recipe Direction',
            dietPlan.response.tuesday.dinner[index].recipe ??
                "not assigned yet"),
        kItem(
            'View Grocery List',
            dietPlan.response.tuesday.dinner[index].grocery ??
                "not assigned yet"),
      ],
    );
  }

  //wednesday meal
  Widget kWednesdayMeal() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Wednesday',
          style: TextStyle(
            color: Colour.kPrimaryColor,
            fontWeight: FontWeight.bold,
            fontSize: getProportionateScreenWidth(20),
          ),
        ),
        //breakfast
        kMealTime('BreakFast'),
        kItem(
            'Item 1',
            dietPlan.response.wednesday.breakfast[index].item ??
                "not assigned yet"),
        kItem(
            'View Recipe Direction',
            dietPlan.response.wednesday.breakfast[index].recipe ??
                "not assigned yet"),
        kItem(
            'View Grocery List',
            dietPlan.response.wednesday.breakfast[index].grocery ??
                "not assigned yet"),
        //lunch
        kMealTime('Lunch'),
        kItem(
            'Item 1',
            dietPlan.response.wednesday.lunch[index].item ??
                "not assigned yet"),
        kItem(
            'View Recipe Direction',
            dietPlan.response.wednesday.lunch[index].recipe ??
                "not assigned yet"),
        kItem(
            'View Grocery List',
            dietPlan.response.wednesday.lunch[index].grocery ??
                "not assigned yet"),
        //snack
        kMealTime('Snack'),
        kItem(
            'Item 1',
            dietPlan.response.wednesday.snacks[index].item ??
                "not assigned yet"),
        kItem(
            'View Recipe Direction',
            dietPlan.response.wednesday.snacks[index].recipe ??
                "not assigned yet"),
        kItem(
            'View Grocery List',
            dietPlan.response.wednesday.snacks[index].grocery ??
                "not assigned yet"),
        //dinner
        kMealTime('Dinner'),
        kItem(
            'Item 1',
            dietPlan.response.wednesday.dinner[index].item ??
                "not assigned yet"),
        kItem(
            'View Recipe Direction',
            dietPlan.response.wednesday.dinner[index].recipe ??
                "not assigned yet"),
        kItem(
            'View Grocery List',
            dietPlan.response.wednesday.dinner[index].grocery ??
                "not assigned yet"),
      ],
    );
  }

  //thursday meal
  Widget kThursdayMeal() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Thursday',
          style: TextStyle(
            color: Colour.kPrimaryColor,
            fontWeight: FontWeight.bold,
            fontSize: getProportionateScreenWidth(20),
          ),
        ),
        //breakfast
        kMealTime('BreakFast'),
        kItem(
            'Item 1',
            dietPlan.response.thursday.breakfast[index].item ??
                "not assigned yet"),
        kItem(
            'View Recipe Direction',
            dietPlan.response.thursday.breakfast[index].recipe ??
                "not assigned yet"),
        kItem(
            'View Grocery List',
            dietPlan.response.thursday.breakfast[index].grocery ??
                "not assigned yet"),
        //lunch
        kMealTime('Lunch'),
        kItem('Item 1',
            dietPlan.response.thursday.lunch[index].item ?? "not assigned yet"),
        kItem(
            'View Recipe Direction',
            dietPlan.response.thursday.lunch[index].recipe ??
                "not assigned yet"),
        kItem(
            'View Grocery List',
            dietPlan.response.thursday.lunch[index].grocery ??
                "not assigned yet"),
        //snack
        kMealTime('Snack'),
        kItem(
            'Item 1',
            dietPlan.response.thursday.snacks[index].item ??
                "not assigned yet"),
        kItem(
            'View Recipe Direction',
            dietPlan.response.thursday.snacks[index].recipe ??
                "not assigned yet"),
        kItem(
            'View Grocery List',
            dietPlan.response.thursday.snacks[index].grocery ??
                "not assigned yet"),
        //dinner
        kMealTime('Dinner'),
        kItem(
            'Item 1',
            dietPlan.response.thursday.dinner[index].item ??
                "not assigned yet"),
        kItem(
            'View Recipe Direction',
            dietPlan.response.thursday.dinner[index].recipe ??
                "not assigned yet"),
        kItem(
            'View Grocery List',
            dietPlan.response.thursday.dinner[index].grocery ??
                "not assigned yet"),
      ],
    );
  }

  //friday meal
  Widget kFridayMeal() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Friday',
          style: TextStyle(
            color: Colour.kPrimaryColor,
            fontWeight: FontWeight.bold,
            fontSize: getProportionateScreenWidth(20),
          ),
        ),
        //breakfast
        kMealTime('BreakFast'),
        kItem(
            'Item 1',
            dietPlan.response.friday.breakfast[index].item ??
                "not assigned yet"),
        kItem(
            'View Recipe Direction',
            dietPlan.response.friday.breakfast[index].recipe ??
                "not assigned yet"),
        kItem(
            'View Grocery List',
            dietPlan.response.friday.breakfast[index].grocery ??
                "not assigned yet"),
        //lunch
        kMealTime('Lunch'),
        kItem('Item 1',
            dietPlan.response.friday.lunch[index].item ?? "not assigned yet"),
        kItem('View Recipe Direction',
            dietPlan.response.friday.lunch[index].recipe ?? "not assigned yet"),
        kItem(
            'View Grocery List',
            dietPlan.response.friday.lunch[index].grocery ??
                "not assigned yet"),
        //snack
        kMealTime('Snack'),
        kItem('Item 1',
            dietPlan.response.friday.snacks[index].item ?? "not assigned yet"),
        kItem(
            'View Recipe Direction',
            dietPlan.response.friday.snacks[index].recipe ??
                "not assigned yet"),
        kItem(
            'View Grocery List',
            dietPlan.response.friday.snacks[index].grocery ??
                "not assigned yet"),
        //dinner
        kMealTime('Dinner'),
        kItem('Item 1',
            dietPlan.response.friday.dinner[index].item ?? "not assigned yet"),
        kItem(
            'View Recipe Direction',
            dietPlan.response.friday.dinner[index].recipe ??
                "not assigned yet"),
        kItem(
            'View Grocery List',
            dietPlan.response.friday.dinner[index].grocery ??
                "not assigned yet"),
      ],
    );
  }

  //saturday meal
  Widget kSaturdayMeal() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Saturday',
          style: TextStyle(
            color: Colour.kPrimaryColor,
            fontWeight: FontWeight.bold,
            fontSize: getProportionateScreenWidth(20),
          ),
        ),
        //breakfast
        kMealTime('BreakFast'),
        kItem(
            'Item 1',
            dietPlan.response.saturday.breakfast[index].item ??
                "not assigned yet"),
        kItem(
            'View Recipe Direction',
            dietPlan.response.saturday.breakfast[index].recipe ??
                "not assigned yet"),
        kItem(
            'View Grocery List',
            dietPlan.response.saturday.breakfast[index].grocery ??
                "not assigned yet"),
        //lunch
        kMealTime('Lunch'),
        kItem('Item 1',
            dietPlan.response.saturday.lunch[index].item ?? "not assigned yet"),
        kItem(
            'View Recipe Direction',
            dietPlan.response.saturday.lunch[index].recipe ??
                "not assigned yet"),
        kItem(
            'View Grocery List',
            dietPlan.response.saturday.lunch[index].grocery ??
                "not assigned yet"),
        //snack
        kMealTime('Snack'),
        kItem(
            'Item 1',
            dietPlan.response.saturday.snacks[index].item ??
                "not assigned yet"),
        kItem(
            'View Recipe Direction',
            dietPlan.response.saturday.snacks[index].recipe ??
                "not assigned yet"),
        kItem(
            'View Grocery List',
            dietPlan.response.saturday.snacks[index].grocery ??
                "not assigned yet"),
        //dinner
        kMealTime('Dinner'),
        kItem(
            'Item 1',
            dietPlan.response.saturday.dinner[index].item ??
                "not assigned yet"),
        kItem(
            'View Recipe Direction',
            dietPlan.response.saturday.dinner[index].recipe ??
                "not assigned yet"),
        kItem(
            'View Grocery List',
            dietPlan.response.saturday.dinner[index].grocery ??
                "not assigned yet"),
      ],
    );
  }

  Widget kMealTime(String title) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Colour.kPrimaryColor,
          ),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            title,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(20),
              color: Colour.kPrimaryColor.withOpacity(0.8),
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: Colour.kPrimaryColor,
          ),
        ),
      ],
    );
  }

  Widget kItem(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title :',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: getProportionateScreenWidth(2),
        ),
        Text(content),
        SizedBox(
          height: getProportionateScreenWidth(15),
        ),
      ],
    );
  }
}
