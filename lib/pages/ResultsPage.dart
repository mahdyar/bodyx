import 'package:bodyx/constants.dart';
import 'package:bodyx/modules/ReplaceFarsiNumber.dart';
import 'package:bodyx/widgets/CalculateButton.dart';
import 'package:bodyx/widgets/CustomizedCard.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'بادیکس | شاخص توده بدنی',
              ),
              backgroundColor: kMainColor,
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      'نتیجه',
                      textAlign: TextAlign.right,
                      style: kTitleTextStyle,
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: CustomizedCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          resultText,
                          style: kResultTextStyle,
                        ),
                        Text(
                          replaceFarsiNumber(bmiResult),
                          style: kBMITextStyle,
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            interpretation,
                            textAlign: TextAlign.center,
                            style: kBodyTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                CalculateButton(
                  label: 'محاسبه مجدد',
                  doOnTap: () {
                    Navigator.pop(context);
                  },
                )
              ],
            )));
  }
}
