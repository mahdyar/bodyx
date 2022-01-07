import 'package:bodyx/pages/ResultsPage.dart';
import 'package:bodyx/widgets/CalculateButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:bodyx/constants.dart';
import 'package:bodyx/widgets/CustomizedCard.dart';
import 'package:bodyx/widgets/GenderCard.dart';
import 'package:bodyx/widgets/CounterCard.dart';
import 'package:bodyx/modules/ReplaceFarsiNumber.dart';
import 'package:bodyx/Calculator.dart';

enum Gender {
  male,
  female
} // Gender types that'll be used in the first column.

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Gender selectedGender = Gender.male;
  int height = kDefaultHeight;
  int weight = kDefaultWeight;
  int age = kDefaultAge;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(widget.title),
            backgroundColor: kMainColor),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: CustomizedCard(
                      cardChild: GenderCard(
                        icon: FontAwesomeIcons.venus,
                        label: 'مونث',
                      ),
                      color: selectedGender == Gender.female
                          ? null
                          : kInactiveCardColor,
                      doOnPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: CustomizedCard(
                      cardChild: GenderCard(
                        icon: FontAwesomeIcons.mars,
                        label: 'مذکر',
                      ),
                      color: selectedGender == Gender.male
                          ? null
                          : kInactiveCardColor,
                      doOnPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CustomizedCard(
                cardChild: Container(
                  margin: EdgeInsets.only(top: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'قد',
                        style: kLabelTextStyle.copyWith(fontSize: 20.0),
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              replaceFarsiNumber(height.toString()),
                              style: kNumericTextStyle,
                            ),
                            SizedBox(
                              width: 1.0,
                            ),
                            Text(
                              'سانتی‌متر',
                              style: kLabelTextStyle,
                            )
                          ],
                        ),
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0xFF8D8E98),
                          thumbColor: kBottomContainerColor,
                          overlayColor: Color(0x1fEB1555),
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 15.0,
                          ),
                          overlayShape: RoundSliderOverlayShape(
                            overlayRadius: 30.0,
                          ),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: kMinHeight,
                          max: kMaxHeight,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: CounterCard(
                        label: "وزن",
                        value: weight,
                        doOnPlusPressed: () {
                          if (validateMaxValue(kMaxWeight, weight)) {
                            setState(() {
                              weight++;
                            });
                          }
                        },
                        doOnMinusPressed: () {
                          if (validateMinValue(kMinWeight, weight)) {
                            setState(() {
                              weight--;
                            });
                          }
                        }),
                  ),
                  Expanded(
                    child: CounterCard(
                        label: "سن",
                        value: age,
                        doOnPlusPressed: () {
                          if (validateMaxValue(kMaxAge, age)) {
                            setState(() {
                              age++;
                            });
                          }
                        },
                        doOnMinusPressed: () {
                          if (validateMinValue(kMinAge, age)) {
                            setState(() {
                              age--;
                            });
                          }
                        }),
                  ),
                ],
              ),
            ),
            CalculateButton(
              label: 'محاسبه',
              doOnTap: () {
                Calculator calculator =
                    Calculator(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                              bmiResult: calculator.calculate(),
                              resultText: calculator.getResults(),
                              interpretation: calculator.getInterpretation(),
                            )));
              },
            )
          ],
        ));
  }

  bool validateMinValue(int min, int value) {
    return value > min ? true : false;
  }

  bool validateMaxValue(int max, int value) {
    return value < max ? true : false;
  }
}
