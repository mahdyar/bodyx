import 'package:flutter/material.dart';
import 'package:bodyx/constants.dart';


class CustomizedCard extends StatelessWidget {
  CustomizedCard({this.cardChild, this.color, this.doOnPress});

  final Widget cardChild;
  final Color color;
  final Function doOnPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: doOnPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color != null ? color : kDefaultColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
