class DietPlan {
  DietPlan({
    this.status,
    this.response,
  });

  String status;
  Response response;

  factory DietPlan.fromJson(Map<String, dynamic> json) => DietPlan(
        status: json["status"] == null ? null : json["status"],
        response: json["response"] == null
            ? null
            : Response.fromJson(json["response"]),
      );
}

class Response {
  Response({
    this.message,
    this.sunday,
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
  });

  String message;
  Day sunday;
  Day monday;
  Day tuesday;
  Day wednesday;
  Day thursday;
  Day friday;
  Day saturday;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        message: json["message"] == null ? null : json["message"],
        sunday: json["Sunday"] == null ? null : Day.fromJson(json["Sunday"]),
        monday: json["Monday"] == null ? null : Day.fromJson(json["Monday"]),
        tuesday: json["Tuesday"] == null ? null : Day.fromJson(json["Tuesday"]),
        wednesday:
            json["Wednesday"] == null ? null : Day.fromJson(json["Wednesday"]),
        thursday:
            json["Thursday"] == null ? null : Day.fromJson(json["Thursday"]),
        friday: json["Friday"] == null ? null : Day.fromJson(json["Friday"]),
        saturday:
            json["Saturday"] == null ? null : Day.fromJson(json["Saturday"]),
      );
}

class Day {
  Day({
    this.breakfast,
    this.lunch,
    this.snacks,
    this.dinner,
  });

  List<MealTime> breakfast;
  List<MealTime> lunch;
  List<MealTime> snacks;
  List<MealTime> dinner;

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        breakfast: json["breakfast"] == null
            ? null
            : List<MealTime>.from(
                json["breakfast"].map((x) => MealTime.fromJson(x))),
        lunch: json["lunch"] == null
            ? null
            : List<MealTime>.from(
                json["lunch"].map((x) => MealTime.fromJson(x))),
        snacks: json["snacks"] == null
            ? null
            : List<MealTime>.from(
                json["snacks"].map((x) => MealTime.fromJson(x))),
        dinner: json["dinner"] == null
            ? null
            : List<MealTime>.from(
                json["dinner"].map((x) => MealTime.fromJson(x))),
      );
}

class MealTime {
  MealTime({
    this.pkId,
    this.timeId,
    this.item,
    this.recipe,
    this.grocery,
    this.dietPlanId,
  });

  String pkId;
  String timeId;
  String item;
  String recipe;
  String grocery;
  String dietPlanId;

  factory MealTime.fromJson(Map<String, dynamic> json) => MealTime(
        pkId: json["pk_id"] == null ? null : json["pk_id"],
        timeId: json["time_id"] == null ? null : json["timeId"],
        item: json["item"] == null ? null : json["item"],
        recipe: json["reciepe"] == null ? null : json["reciepe"],
        grocery: json["grocery"] == null ? null : json["grocery"],
        dietPlanId: json["dietplan_id"] == null ? null : json["dietplan_id"],
      );
}
