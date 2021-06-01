class HealthHistory {
  HealthHistory({
    this.status,
    this.response,
  });

  String status;
  Response response;

  // check box #1
  String poorImmunity;
  String acidity;
  String constipation;

  // check box #2
  String diarrhoea;
  String leakyGut;
  String diagnosedIBS;

  // check box #3
  String autoImmune;
  String allergiesIntolerance;
  String insulin;

  // section 1
  String name;
  String address;
  String email;
  String age;
  String gender;
  String dob;

  // section 2
  String currentWeight;
  String weight6Month;
  String weight1Year;
  String weightDifferent;

  // weight different => yes
  String intendLose;
  String relationship;
  String children;
  String occupation;
  String lineOfWork;

  //section 3
  String workStress;
  String longHours;
  String domesticLife;
  String healthConcern;
  String diagnosed;

  //section 4
  String medication;
  String supplements;
  String familyGut;
  String bloodGroup;
  String hormonePills;

  //section 5
  String menstrualCycle;
  String constipationDiarrhoeaGas;
  String howLongConstipation;
  String foodAllergies;
  String physicalActive;

  //section 6
  String dailyExercise;
  String foodTiming;

  // check box #4
  String morning;
  String afternoon;
  String evening;
  String night;

  //section 7
  String howLongExercise;
  String portionSize;
  String waterInDay;

  // check box #5
  String drink;
  String smoking;
  String softDrink;

  //section 8
  String majorAddiction;
  String foodSugarDrugs;
  String eatLot;
  String eatMoreUpset;
  String teachFor;
  String relevantInfo;
  String userId;

  factory HealthHistory.fromJson(Map<String, dynamic> json) => HealthHistory(
        status: json["status"] == null ? null : json["status"],
        response: json["response"] == null
            ? null
            : Response.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        // check box #1
        "poorImmunity": poorImmunity == null ? null : poorImmunity,
        "acidity": acidity == null ? null : acidity,
        "constipation": constipation == null ? null : constipation,

        // check box #2
        "diarrhoea": diarrhoea == null ? null : diarrhoea,
        "leakyGut": leakyGut == null ? null : leakyGut,
        "diagnosedIBS": diagnosedIBS == null ? null : diagnosedIBS,

        // check box #3
        "immuneDiseases": autoImmune == null ? null : autoImmune,
        "foodAlergies":
            allergiesIntolerance == null ? null : allergiesIntolerance,
        "insulinResistance": insulin == null ? null : insulin,

        // section #1
        "name": name == null ? null : name,
        "adress": address == null ? null : address,
        "email": email == null ? null : email,
        "age": age == null ? null : age,
        "gender": gender == null ? null : gender,
        "dob": dob == null ? null : dob,

        // section #2
        "currentWeigt": currentWeight == null ? null : currentWeight,
        "weightSixMonthBefore": weight6Month == null ? null : weight6Month,
        "weighOneYearBefore": weight1Year == null ? null : weight1Year,
        "weightDifferent": weightDifferent == null ? null : weightDifferent,

        // weight different => yes
        // weight #1
        "intentLose": intendLose == null ? "null" : intendLose,
        "relationship": relationship == null ? "null" : relationship,
        "children": children == null ? "null" : children,
        "occupation": occupation == null ? "null" : occupation,
        // weight #2
        "lineOfWork": lineOfWork == null ? "null" : lineOfWork,
        "stressOnWork": workStress == null ? "null" : workStress,
        "workHour": longHours == null ? "null" : longHours,
        "demesticLife": domesticLife == null ? "null" : domesticLife,
        // weight #3
        "healthConcerns": healthConcern == null ? "null" : healthConcern,
        "diagnosed": diagnosed == null ? "null" : diagnosed,
        "medication": medication == null ? "null" : medication,
        "suppliments": supplements == null ? "null" : supplements,

        // section #3
        "helathProblem": familyGut == null ? null : familyGut,
        "bloodGroop": bloodGroup == null ? null : bloodGroup,
        "controlpills": hormonePills == null ? null : hormonePills,

        // section #5
        "menstrualCycle": menstrualCycle == null ? null : menstrualCycle,
        "allergiesOrSensitivities":
            constipationDiarrhoeaGas == null ? null : constipationDiarrhoeaGas,
        "howLongAllergiesOrSensitivities":
            howLongConstipation == null ? null : howLongConstipation,
        "foodAllergies": foodAllergies == null ? null : foodAllergies,
        "physicallyActive": physicalActive == null ? null : physicalActive,

        // section #6
        "dailyExercise": dailyExercise == null ? null : dailyExercise,
        "foodTiming": foodTiming == null ? null : foodTiming,

        // check box #4
        "exerciseTimeMoring": morning == null ? null : morning,
        "exerciseTimeAfternoon": afternoon == null ? null : afternoon,
        "exerciseTimeEvening": evening == null ? null : evening,
        "exerciseTimeNight": night == null ? null : night,

        // section #7
        "exerciseFrom": howLongExercise == null ? null : howLongExercise,
        "exercisePortionSize": portionSize == null ? null : portionSize,
        "waterQuantity": waterInDay == null ? null : waterInDay,

        // check box #5
        "consumeDrink": drink == null ? null : drink,
        "consumeSmoking": smoking == null ? null : smoking,
        "consumeSoftDrink": softDrink == null ? null : softDrink,

        // section #8
        "addiction": majorAddiction == null ? null : majorAddiction,
        "foodSugarDrugs": foodSugarDrugs == null ? null : foodSugarDrugs,
        "eatFrom": eatLot == null ? null : eatLot,
        "dailyEatMoreWhenUpset": eatMoreUpset == null ? null : eatMoreUpset,
        "teachMore": teachFor == null ? null : teachFor,
        "relevantInfoDescription": relevantInfo == null ? null : relevantInfo,
        "user_id": userId == null ? null : userId,
      };
}

class Response {
  Response({
    this.message,
  });

  String message;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        message: json["message"] == null ? null : json["message"],
      );
}
