import 'package:flutter/material.dart';
import 'package:bodyx/constants.dart';
import 'package:bodyx/widgets/RoundActionButton.dart';
import 'package:bodyx/widgets/CustomizedCard.dart';
import 'package:bodyx/modules/ReplaceFarsiNumber.dart';

class CounterCard extends StatelessWidget {
  CounterCard({
    this.label,
    this.value,
    this.doOnPlusPressed,
    this.doOnMinusPressed,
  });
  final Function doOnPlusPressed;
  final Function doOnMinusPressed;
  final String label;
  final int value;
  @override
  Widget build(BuildContext context) {
    return CustomizedCard(
      cardChild: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            label,
            style: kLabelTextStyle,
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            replaceFarsiNumber(value.toString()),
            style: kNumericTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RoundActionButton(
                icon: Icons.add,
                doOnPress: doOnPlusPressed,
              ),
              SizedBox(
                width: 10.0,
              ),
              RoundActionButton(icon: Icons.remove, doOnPress: doOnMinusPressed)
            ],
          ),
        ],
      ),
    );
  }
}
