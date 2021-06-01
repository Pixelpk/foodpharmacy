import 'package:flutter/material.dart';
import 'package:foodpharmacy/apis/api_client.dart';
import 'package:foodpharmacy/components/colour.dart';
import 'package:foodpharmacy/components/pref_manager.dart';
import 'package:foodpharmacy/components/progress_bar.dart';
import 'package:foodpharmacy/components/t.dart';
import 'package:foodpharmacy/media_config.dart';
import 'package:foodpharmacy/models/coaching/health_history.dart';
import 'package:foodpharmacy/models/coaching/select_blood.dart';
import 'package:foodpharmacy/models/coaching/select_gender.dart';
import 'package:foodpharmacy/models/coaching/select_relationship.dart';

class HealthFrom extends StatefulWidget {
  @override
  _HealthFromState createState() => _HealthFromState();
}

class _HealthFromState extends State<HealthFrom> {
  var formKey = GlobalKey<FormState>();
  String selectGender = "Male";
  String selectBlood = "A+";
  String selectRelation = "Single";
  DateTime selectDate = DateTime.now();

  var healthHistory = HealthHistory();

  //check box #1
  bool checkImmunity = false;
  bool checkAcidity = false;
  bool checkConstipation = false;
  bool checkDia = false;
  bool checkLeaky = false;
  bool checkDiagnosed = false;
  bool checkAuto = false;
  bool checkFood = false;
  bool checkInsulin = false;

  //radio buttons
  String weightRadioBtn = 'No';
  String gutRadioBtn = 'Yes';
  String birthRadioBtn = 'Yes';
  String foodRadioBtn = 'Yes';
  String physicalRadioBtn = 'Yes';
  String dailyRadioBtn = 'Yes';
  String eatRadioBtn = 'Yes';
  String relevantRadioBtn = 'Yes';

  //check box #2
  bool checkMorning = false;
  bool checkAfterNoon = false;
  bool checkEvening = false;
  bool checkNight = false;

  //check box #3
  bool checkDrink = false;
  bool checkSmoking = false;
  bool checkSoftDrink = false;

  String token, name, email, userId;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    token = await PrefManager.getToken();
    name = await PrefManager.getName();
    email = await PrefManager.getEmail();
    userId = await PrefManager.getUserId();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          kSelectDisease(),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kAddressForm(),
                kAgeForm(),
                kGenderSection(),
                kDateOfBirth(),
                currentWeightForm(),
                weight6MonthForm(),
                weight1YearForm(),
                kWeightDifferent(),

                //yes weight different
                (weightRadioBtn == 'Yes') ? kYesWeightDifferent() : Container(),

                kFamilyGutProblem(),
                kBloodGroup(),
                kBirthControl(),
                kMenstrual(),
                kConstipationDiarrhoeaGas(),
                kHowLongConstipation(),
                kFoodAllergies(),
                kPhysicalActive(),
                kDailyExercise(),
                kFoodTiming(),
                kExerciseTime(),
                kExerciseHowLong(),
                kPortionSize(),
                kWaterInDay(),
                kDrinkSmokeSoft(),
                kMajorAddiction(),
                kFoodSugarDrug(),
                kEatLot(),
                kEatLotWhenUpset(),
                kTeachFor(),
                kRelevantInformation(),
                kSubmitButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget kSelectDisease() {
    return Column(
      children: [
        SizedBox(
          height: getProportionateScreenWidth(40),
          child: CheckboxListTile(
            title: Text('Poor Immunity'),
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Colour.kPrimaryColor,
            value: checkImmunity,
            contentPadding: EdgeInsets.all(0),
            onChanged: (bool value) {
              setState(() {
                checkImmunity = value;
              });
            },
          ),
        ),
        SizedBox(
          height: getProportionateScreenWidth(40),
          child: CheckboxListTile(
            title: Text('Acidity'),
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Colour.kPrimaryColor,
            value: checkAcidity,
            contentPadding: EdgeInsets.all(0),
            onChanged: (bool value) {
              setState(() {
                checkAcidity = value;
              });
            },
          ),
        ),
        SizedBox(
          height: getProportionateScreenWidth(40),
          child: CheckboxListTile(
            title: Text('Constipation'),
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Colour.kPrimaryColor,
            value: checkConstipation,
            contentPadding: EdgeInsets.all(0),
            onChanged: (bool value) {
              setState(() {
                checkConstipation = value;
              });
            },
          ),
        ),
        // step 2
        SizedBox(
          height: getProportionateScreenWidth(40),
          child: CheckboxListTile(
            title: Text('Diarrhoea'),
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Colour.kPrimaryColor,
            value: checkDia,
            contentPadding: EdgeInsets.all(0),
            onChanged: (bool value) {
              setState(() {
                checkDia = value;
              });
            },
          ),
        ),
        SizedBox(
          height: getProportionateScreenWidth(40),
          child: CheckboxListTile(
            title: Text('Leaky Gut with is the precursor to'),
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Colour.kPrimaryColor,
            value: checkLeaky,
            contentPadding: EdgeInsets.all(0),
            onChanged: (bool value) {
              setState(() {
                checkLeaky = value;
              });
            },
          ),
        ),
        SizedBox(
          height: getProportionateScreenWidth(40),
          child: CheckboxListTile(
            title: Text('Diagnosed IBS'),
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Colour.kPrimaryColor,
            value: checkDiagnosed,
            contentPadding: EdgeInsets.all(0),
            onChanged: (bool value) {
              setState(() {
                checkDiagnosed = value;
              });
            },
          ),
        ),
        // step 3
        SizedBox(
          height: getProportionateScreenWidth(40),
          child: CheckboxListTile(
            title: Text('Auto-Immune diseases'),
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Colour.kPrimaryColor,
            value: checkAuto,
            contentPadding: EdgeInsets.all(0),
            onChanged: (bool value) {
              setState(() {
                checkAuto = value;
              });
            },
          ),
        ),
        SizedBox(
          height: getProportionateScreenWidth(40),
          child: CheckboxListTile(
            title: Text('Food allergies and intolerance'),
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Colour.kPrimaryColor,
            value: checkFood,
            contentPadding: EdgeInsets.all(0),
            onChanged: (bool value) {
              setState(() {
                checkFood = value;
              });
            },
          ),
        ),
        SizedBox(
          height: getProportionateScreenWidth(40),
          child: CheckboxListTile(
            title: Text('Insulin resistance'),
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Colour.kPrimaryColor,
            value: checkInsulin,
            contentPadding: EdgeInsets.all(0),
            onChanged: (bool value) {
              setState(() {
                checkInsulin = value;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget kAddressForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: getProportionateScreenWidth(15),
        ),
        Text('Address:'),
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
          child: TextFormField(
            onSaved: (value) => healthHistory.address = value.toString().trim(),
            validator: (value) {
              if (value.isEmpty) {
                return '* required';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget kAgeForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Age:'),
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
          child: TextFormField(
            onSaved: (value) => healthHistory.age = value.toString().trim(),
            validator: (value) {
              if (value.isEmpty) {
                return '* required';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget kGenderSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Gender'),
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
          child: Container(
            height: getProportionateScreenWidth(45),
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0)),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  DropdownButton(
                    items: genderList.map((SelectGender e) {
                      return DropdownMenuItem<String>(
                        value: e.gender,
                        child: Text(
                          e.gender,
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                      );
                    }).toList(),
                    hint: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(10)),
                      child: Text(
                        selectGender,
                      ),
                    ),
                    onChanged: (val) {
                      setState(() {
                        selectGender = val;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget kDateOfBirth() {
    chooseDOB() async {
      final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2025),
        initialDatePickerMode: DatePickerMode.year,
        helpText: 'SELECT DATE OF BIRTH',
      );
      if (picked != null && picked != selectDate) {
        setState(() {
          selectDate = picked;
        });
      }
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {
              chooseDOB();
            },
            style: ElevatedButton.styleFrom(
              primary: Colour.kPrimaryColor,
              elevation: 0.0,
            ),
            child: Text('Choose DOB'),
          ),
          SizedBox(
            width: getProportionateScreenWidth(10),
          ),
          Container(
            height: getProportionateScreenWidth(35),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius:
                    BorderRadius.circular(getProportionateScreenWidth(5))),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(10)),
              child:
                  Center(child: Text("${selectDate.toLocal()}".split(' ')[0])),
            ),
          ),
        ],
      ),
    );
  }

  Widget currentWeightForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Current Weight:'),
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
          child: TextFormField(
            onSaved: (value) =>
                healthHistory.currentWeight = value.toString().trim(),
            validator: (value) {
              if (value.isEmpty) {
                return '* required';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget weight6MonthForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Weight 6 months ago:'),
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
          child: TextFormField(
            onSaved: (value) =>
                healthHistory.weight6Month = value.toString().trim(),
            validator: (value) {
              if (value.isEmpty) {
                return '* required';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget weight1YearForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Weight 1 year ago:'),
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
          child: TextFormField(
            onSaved: (value) =>
                healthHistory.weight1Year = value.toString().trim(),
            validator: (value) {
              if (value.isEmpty) {
                return '* required';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget kWeightDifferent() {
    handleWeightChange(String value) {
      setState(() {
        weightRadioBtn = value;
      });
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: getProportionateScreenWidth(5),
        ),
        Text('Would you like your weight to be different?'),
        Row(
          children: [
            Text('Yes'),
            Radio<String>(
              value: 'Yes',
              groupValue: weightRadioBtn,
              onChanged: handleWeightChange,
              activeColor: Colour.kPrimaryColor,
            ),
            Text('No'),
            Radio<String>(
              value: 'No',
              groupValue: weightRadioBtn,
              onChanged: handleWeightChange,
              activeColor: Colour.kPrimaryColor,
            ),
          ],
        ),
      ],
    );
  }

  Widget kYesWeightDifferent() {
    return Column(
      children: [
        kIntendLoseForm(),
        kRelationshipSection(),
        kChildrenForm(),
        kOccupationForm(),
        kLikeWorkForm(),
        kStressAtWorkForm(),
        kWorkHoursForm(),
        kDomesticLifeForm(),
        kGutConcernForm(),
        kWhenDiagnosedForm(),
        kMedicationForm(),
        kSupplementForm(),
      ],
    );
  }

  Widget kIntendLoseForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('How to do you intend to lose?'),
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
          child: TextFormField(
            onSaved: (value) =>
                healthHistory.intendLose = value.toString().trim(),
            validator: (value) {
              if (value.isEmpty) {
                return '* required';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget kRelationshipSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Relationship Status'),
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
          child: Container(
            height: getProportionateScreenWidth(45),
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0)),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  DropdownButton(
                    items: relationList.map((SelectRelationship e) {
                      return DropdownMenuItem<String>(
                        value: e.relation,
                        child: Text(
                          e.relation,
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                      );
                    }).toList(),
                    hint: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(10)),
                      child: Text(
                        selectRelation,
                      ),
                    ),
                    onChanged: (val) {
                      setState(() {
                        selectRelation = val;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget kChildrenForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Children'),
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
          child: TextFormField(
            onSaved: (value) =>
                healthHistory.children = value.toString().trim(),
            validator: (value) {
              if (value.isEmpty) {
                return '* required';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget kOccupationForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Occupation'),
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
          child: TextFormField(
            onSaved: (value) =>
                healthHistory.occupation = value.toString().trim(),
            validator: (value) {
              if (value.isEmpty) {
                return '* required';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget kLikeWorkForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Do you like your line of work?'),
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
          child: TextFormField(
            onSaved: (value) =>
                healthHistory.lineOfWork = value.toString().trim(),
            validator: (value) {
              if (value.isEmpty) {
                return '* required';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget kStressAtWorkForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('How much stress do you face at work? Please describe.'),
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
          child: TextFormField(
            maxLines: 3,
            onSaved: (value) =>
                healthHistory.workStress = value.toString().trim(),
            validator: (value) {
              if (value.isEmpty) {
                return '* required';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget kWorkHoursForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Do you work long hours?'),
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
          child: TextFormField(
            onSaved: (value) =>
                healthHistory.longHours = value.toString().trim(),
            validator: (value) {
              if (value.isEmpty) {
                return '* required';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget kDomesticLifeForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Describe your domestic life?'),
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
          child: TextFormField(
            maxLines: 3,
            onSaved: (value) =>
                healthHistory.domesticLife = value.toString().trim(),
            validator: (value) {
              if (value.isEmpty) {
                return '* required';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget kGutConcernForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Please list your main gut health concerns?'),
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
          child: TextFormField(
            maxLines: 3,
            onSaved: (value) =>
                healthHistory.healthConcern = value.toString().trim(),
            validator: (value) {
              if (value.isEmpty) {
                return '* required';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget kWhenDiagnosedForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('When were you diagnosed?'),
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
          child: TextFormField(
            onSaved: (value) =>
                healthHistory.diagnosed = value.toString().trim(),
            validator: (value) {
              if (value.isEmpty) {
                return '* required';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget kMedicationForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('What medication are you taking if any?'),
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
          child: TextFormField(
            onSaved: (value) =>
                healthHistory.medication = value.toString().trim(),
            validator: (value) {
              if (value.isEmpty) {
                return '* required';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget kSupplementForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('What supplements are you taking if any?'),
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
          child: TextFormField(
            maxLines: 3,
            onSaved: (value) =>
                healthHistory.supplements = value.toString().trim(),
            validator: (value) {
              if (value.isEmpty) {
                return '* required';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget kFamilyGutProblem() {
    handleGutChange(String value) {
      setState(() {
        gutRadioBtn = value;
      });
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: getProportionateScreenWidth(5),
        ),
        Text('Are the members of your family with same gut health problem?'),
        Row(
          children: [
            Text('Yes'),
            Radio<String>(
              value: 'Yes',
              groupValue: gutRadioBtn,
              onChanged: handleGutChange,
              activeColor: Colour.kPrimaryColor,
            ),
            Text('No'),
            Radio<String>(
              value: 'No',
              groupValue: gutRadioBtn,
              onChanged: handleGutChange,
              activeColor: Colour.kPrimaryColor,
            ),
          ],
        ),
      ],
    );
  }

  Widget kBloodGroup() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('What is your blood group?'),
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
          child: Container(
            height: getProportionateScreenWidth(45),
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0)),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  DropdownButton(
                    items: bloodList.map((SelectBlood e) {
                      return DropdownMenuItem<String>(
                        value: e.blood,
                        child: Text(
                          e.blood,
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                      );
                    }).toList(),
                    hint: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(10)),
                      child: Text(
                        selectBlood,
                      ),
                    ),
                    onChanged: (val) {
                      setState(() {
                        selectBlood = val;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget kBirthControl() {
    handleBirthChange(String value) {
      setState(() {
        birthRadioBtn = value;
      });
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: getProportionateScreenWidth(5),
        ),
        Text('Are you taking hormone birth control pills?'),
        Row(
          children: [
            Text('Yes'),
            Radio<String>(
              value: 'Yes',
              groupValue: birthRadioBtn,
              onChanged: handleBirthChange,
              activeColor: Colour.kPrimaryColor,
            ),
            Text('No'),
            Radio<String>(
              value: 'No',
              groupValue: birthRadioBtn,
              onChanged: handleBirthChange,
              activeColor: Colour.kPrimaryColor,
            ),
          ],
        ),
      ],
    );
  }

  FocusNode menstrualNode = FocusNode();

  Widget kMenstrual() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('(Females only) Describe your menstrual cycle'),
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
          child: TextFormField(
            focusNode: menstrualNode,
            onSaved: (value) =>
                healthHistory.menstrualCycle = value.toString().trim(),
            validator: (value) {
              if (value.isEmpty) {
                return '* required';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget kConstipationDiarrhoeaGas() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Describe your digestion; constipation/ diarrhoea/gas? And for how long has it been this way?Do you have any food allergies or sensitivities?',
          style: TextStyle(
            color: Colour.kPrimaryColor,
          ),
        ),
        Text('constipation/ diarrhoea/gas'),
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
          child: TextFormField(
            onSaved: (value) => healthHistory.constipationDiarrhoeaGas =
                value.toString().trim(),
            validator: (value) {
              if (value.isEmpty) {
                return '* required';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget kHowLongConstipation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'How long has it been this way?',
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
          child: TextFormField(
            onSaved: (value) =>
                healthHistory.howLongConstipation = value.toString().trim(),
            validator: (value) {
              if (value.isEmpty) {
                return '* required';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget kFoodAllergies() {
    handleFoodChange(String value) {
      setState(() {
        foodRadioBtn = value;
      });
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: getProportionateScreenWidth(5),
        ),
        Text('Do you have any food allergies or sensitivities?'),
        Row(
          children: [
            Text('Yes'),
            Radio<String>(
              value: 'Yes',
              groupValue: foodRadioBtn,
              onChanged: handleFoodChange,
              activeColor: Colour.kPrimaryColor,
            ),
            Text('No'),
            Radio<String>(
              value: 'No',
              groupValue: foodRadioBtn,
              onChanged: handleFoodChange,
              activeColor: Colour.kPrimaryColor,
            ),
          ],
        ),
      ],
    );
  }

  Widget kPhysicalActive() {
    handlePhysicalChange(String value) {
      setState(() {
        physicalRadioBtn = value;
      });
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: getProportionateScreenWidth(5),
        ),
        Text('Are you physically active?'),
        Row(
          children: [
            Text('Yes'),
            Radio<String>(
              value: 'Yes',
              groupValue: physicalRadioBtn,
              onChanged: handlePhysicalChange,
              activeColor: Colour.kPrimaryColor,
            ),
            Text('No'),
            Radio<String>(
              value: 'No',
              groupValue: physicalRadioBtn,
              onChanged: handlePhysicalChange,
              activeColor: Colour.kPrimaryColor,
            ),
          ],
        ),
      ],
    );
  }

  Widget kDailyExercise() {
    handleChange(String value) {
      setState(() {
        dailyRadioBtn = value;
      });
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: getProportionateScreenWidth(5),
        ),
        Text(
            'Do you engage in any daily exercise? If so please describe. If you don’t please explain why?'),
        Row(
          children: [
            Text('Yes'),
            Radio<String>(
              value: 'Yes',
              groupValue: dailyRadioBtn,
              onChanged: handleChange,
              activeColor: Colour.kPrimaryColor,
            ),
            Text('No'),
            Radio<String>(
              value: 'No',
              groupValue: dailyRadioBtn,
              onChanged: handleChange,
              activeColor: Colour.kPrimaryColor,
            ),
          ],
        ),
      ],
    );
  }

  Widget kFoodTiming() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Food',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colour.kPrimaryColor,
          ),
        ),
        Text(
          'Please describe with timings in detail',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colour.kPrimaryColor,
          ),
        ),
        Text('what you eat and drink for breakfast through to dinner?'),
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
          child: TextFormField(
            onSaved: (value) =>
                healthHistory.foodTiming = value.toString().trim(),
            validator: (value) {
              if (value.isEmpty) {
                return '* required';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget kExerciseTime() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: getProportionateScreenWidth(5),
        ),
        Text('What time you exercise if you do so?'),
        SizedBox(
          height: getProportionateScreenWidth(40),
          child: CheckboxListTile(
            title: Text('Morning'),
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Colour.kPrimaryColor,
            value: checkMorning,
            contentPadding: EdgeInsets.all(0),
            onChanged: (bool value) {
              setState(() {
                checkMorning = value;
              });
            },
          ),
        ),
        SizedBox(
          height: getProportionateScreenWidth(40),
          child: CheckboxListTile(
            title: Text('Afternoon'),
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Colour.kPrimaryColor,
            value: checkAfterNoon,
            contentPadding: EdgeInsets.all(0),
            onChanged: (bool value) {
              setState(() {
                checkAfterNoon = value;
              });
            },
          ),
        ),
        SizedBox(
          height: getProportionateScreenWidth(40),
          child: CheckboxListTile(
            title: Text('Evening'),
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Colour.kPrimaryColor,
            value: checkEvening,
            contentPadding: EdgeInsets.all(0),
            onChanged: (bool value) {
              setState(() {
                checkEvening = value;
              });
            },
          ),
        ),
        SizedBox(
          height: getProportionateScreenWidth(40),
          child: CheckboxListTile(
            title: Text('Night'),
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Colour.kPrimaryColor,
            value: checkNight,
            contentPadding: EdgeInsets.all(0),
            onChanged: (bool value) {
              setState(() {
                checkNight = value;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget kExerciseHowLong() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: getProportionateScreenWidth(10),
        ),
        Text(
          'and for how long?',
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
          child: TextFormField(
            onSaved: (value) =>
                healthHistory.howLongExercise = value.toString().trim(),
            validator: (value) {
              if (value.isEmpty) {
                return '* required';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget kPortionSize() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Describe your portion size?',
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
          child: TextFormField(
            onSaved: (value) =>
                healthHistory.portionSize = value.toString().trim(),
            validator: (value) {
              if (value.isEmpty) {
                return '* required';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget kWaterInDay() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'How much water do you drink in the day?',
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
          child: TextFormField(
            onSaved: (value) =>
                healthHistory.waterInDay = value.toString().trim(),
            validator: (value) {
              if (value.isEmpty) {
                return '* required';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget kDrinkSmokeSoft() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: getProportionateScreenWidth(5),
        ),
        Text('Do you drink or smoke or consume soft drinks?'),
        SizedBox(
          height: getProportionateScreenWidth(40),
          child: CheckboxListTile(
            title: Text('Drink'),
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Colour.kPrimaryColor,
            value: checkDrink,
            contentPadding: EdgeInsets.all(0),
            onChanged: (bool value) {
              setState(() {
                checkDrink = value;
              });
            },
          ),
        ),
        SizedBox(
          height: getProportionateScreenWidth(40),
          child: CheckboxListTile(
            title: Text('Smoking'),
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Colour.kPrimaryColor,
            value: checkSmoking,
            contentPadding: EdgeInsets.all(0),
            onChanged: (bool value) {
              setState(() {
                checkSmoking = value;
              });
            },
          ),
        ),
        SizedBox(
          height: getProportionateScreenWidth(40),
          child: CheckboxListTile(
            title: Text('Soft Drink'),
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Colour.kPrimaryColor,
            value: checkSoftDrink,
            contentPadding: EdgeInsets.all(0),
            onChanged: (bool value) {
              setState(() {
                checkSoftDrink = value;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget kMajorAddiction() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: getProportionateScreenWidth(10),
        ),
        Text(
          'Do you have any major addiction?',
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
          child: TextFormField(
            onSaved: (value) =>
                healthHistory.majorAddiction = value.toString().trim(),
            validator: (value) {
              if (value.isEmpty) {
                return '* required';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget kFoodSugarDrug() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Food or sugar or drugs?',
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
          child: TextFormField(
            onSaved: (value) =>
                healthHistory.foodSugarDrugs = value.toString().trim(),
            validator: (value) {
              if (value.isEmpty) {
                return '* required';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget kEatLot() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Do you eat out a lot, or cook at home ?',
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
          child: TextFormField(
            onSaved: (value) => healthHistory.eatLot = value.toString().trim(),
            validator: (value) {
              if (value.isEmpty) {
                return '* required';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget kEatLotWhenUpset() {
    handleEatChange(String value) {
      setState(() {
        eatRadioBtn = value;
      });
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: getProportionateScreenWidth(5),
        ),
        Text('Do you eat more when you are upset or stressed or angry?'),
        Row(
          children: [
            Text('Yes'),
            Radio<String>(
              value: 'Yes',
              groupValue: eatRadioBtn,
              onChanged: handleEatChange,
              activeColor: Colour.kPrimaryColor,
            ),
            Text('No'),
            Radio<String>(
              value: 'No',
              groupValue: eatRadioBtn,
              onChanged: handleEatChange,
              activeColor: Colour.kPrimaryColor,
            ),
          ],
        ),
      ],
    );
  }

  Widget kTeachFor() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'If so what do you teach for?',
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
          child: TextFormField(
            onSaved: (value) =>
                healthHistory.teachFor = value.toString().trim(),
            validator: (value) {
              if (value.isEmpty) {
                return '* required';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget kRelevantInformation() {
    handleRelevantChange(String value) {
      setState(() {
        relevantRadioBtn = value;
      });
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: getProportionateScreenWidth(5),
        ),
        Text('Is there any other relevant information I need to know?'),
        Row(
          children: [
            Text('Yes'),
            Radio<String>(
              value: 'Yes',
              groupValue: relevantRadioBtn,
              onChanged: handleRelevantChange,
              activeColor: Colour.kPrimaryColor,
            ),
            Text('No'),
            Radio<String>(
              value: 'No',
              groupValue: relevantRadioBtn,
              onChanged: handleRelevantChange,
              activeColor: Colour.kPrimaryColor,
            ),
          ],
        ),
      ],
    );
  }

  Widget kSubmitButton() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: ElevatedButton(
          onPressed: () {
            validateAndSend();
          },
          style: ElevatedButton.styleFrom(
            primary: Colour.kPrimaryColor,
            elevation: 0.0,
          ),
          child: Text('Submit'),
        ),
      ),
    );
  }

  void validateAndSend() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();

      //check box #1
      healthHistory.poorImmunity = (checkImmunity == false) ? 'No' : 'Yes';
      healthHistory.acidity = (checkAcidity == false) ? 'No' : 'Yes';
      healthHistory.constipation = (checkConstipation == false) ? 'No' : 'Yes';
      //check box #2
      healthHistory.diarrhoea = (checkDia == false) ? 'No' : 'Yes';
      healthHistory.leakyGut = (checkLeaky == false) ? 'No' : 'Yes';
      healthHistory.diagnosedIBS = (checkDiagnosed == false) ? 'No' : 'Yes';
      //check box #3
      healthHistory.autoImmune = (checkAuto == false) ? 'No' : 'Yes';
      healthHistory.allergiesIntolerance = (checkFood == false) ? 'No' : 'Yes';
      healthHistory.insulin = (checkInsulin == false) ? 'No' : 'Yes';

      //section #4
      healthHistory.name = name;
      healthHistory.email = email;
      healthHistory.userId = userId;
      healthHistory.gender = selectGender;
      if ('${selectDate.toLocal()}'.split(' ')[0] ==
          '${DateTime.now()}'.split(' ')[0]) {
        T.message('select date of birth');
        return;
      }
      ProgressBar.indicator.show(context);
      healthHistory.dob = '${selectDate.toLocal()}'.split(' ')[0];
      healthHistory.weightDifferent = weightRadioBtn;
      healthHistory.relationship = selectRelation;
      healthHistory.familyGut = gutRadioBtn;
      healthHistory.bloodGroup = selectBlood;
      healthHistory.hormonePills = birthRadioBtn;

      //section #5
      healthHistory.foodAllergies = foodRadioBtn;
      healthHistory.physicalActive = physicalRadioBtn;
      healthHistory.dailyExercise = dailyRadioBtn;

      //check box #4
      healthHistory.morning = (checkMorning == false) ? 'null' : 'Morning';
      healthHistory.afternoon =
          (checkAfterNoon == false) ? 'null' : 'Afternoon';
      healthHistory.evening = (checkEvening == false) ? 'null' : 'Evening';
      healthHistory.night = (checkNight == false) ? 'null' : 'Night';

      //check box #5
      healthHistory.drink = (checkDrink == false) ? 'null' : 'Drink';
      healthHistory.smoking = (checkSmoking == false) ? 'null' : 'Smoking';
      healthHistory.softDrink =
          (checkSoftDrink == false) ? 'null' : 'Soft Drink';

      //section #6
      healthHistory.eatMoreUpset = eatRadioBtn;
      healthHistory.relevantInfo = relevantRadioBtn;

      // print(
      //     '${healthHistory.poorImmunity} ${healthHistory.acidity} ${healthHistory.constipation} ${healthHistory.diarrhoea} ${healthHistory.leakyGut}');
      // print(
      //     '${healthHistory.diagnosedIBS} ${healthHistory.autoImmune} ${healthHistory.allergiesIntolerance} ${healthHistory.insulin}');
      // print(
      //     '${healthHistory.address}  ${healthHistory.age} ${healthHistory.gender} ${healthHistory.dob}');
      // print(
      //     '${healthHistory.currentWeight} ${healthHistory.weight6Month} ${healthHistory.weight1Year} ${healthHistory.weightDifferent}');
      // print(
      //     '${healthHistory.intendLose} ${healthHistory.relationship} ${healthHistory.children} ${healthHistory.occupation} ${healthHistory.lineOfWork}');
      // print(
      //     '${healthHistory.workStress} ${healthHistory.longHours} ${healthHistory.domesticLife} ${healthHistory.healthConcern} ${healthHistory.diagnosed}');
      // print(
      //     '${healthHistory.medication} ${healthHistory.supplements} ${healthHistory.familyGut} ${healthHistory.bloodGroup} ${healthHistory.hormonePills}');
      // print(
      //     '${healthHistory.menstrualCycle} ${healthHistory.constipationDiarrhoeaGas} ${healthHistory.howLongConstipation} ${healthHistory.foodAllergies}');
      // print(
      //     '${healthHistory.physicalActive} ${healthHistory.dailyExercise} ${healthHistory.foodTiming}');
      // print(
      //     '${healthHistory.morning} ${healthHistory.afternoon} ${healthHistory.evening} ${healthHistory.night}');
      // print(
      //     '${healthHistory.howLongExercise} ${healthHistory.portionSize} ${healthHistory.waterInDay}');
      // print(
      //     '${healthHistory.drink} ${healthHistory.smoking} ${healthHistory.softDrink}');
      // print(
      //     '${healthHistory.majorAddiction} ${healthHistory.foodSugarDrugs} ${healthHistory.eatLot}');
      // print(
      //     '${healthHistory.eatMoreUpset} ${healthHistory.teachFor} ${healthHistory.relevantInfo}');

      ApiClient.apiClient.healthHistoryApi(healthHistory, token).then((value) {
        ProgressBar.indicator.hide();
        T.message(value.response.message);
        Navigator.pop(context);
      }).catchError((e) {
        ProgressBar.indicator.hide();
        T.message(e.toString());
      }).whenComplete(() {
        ProgressBar.indicator.hide();
      });
    }
  }
}
