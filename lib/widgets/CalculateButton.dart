import 'package:flutter/material.dart';
import 'package:bodyx/constants.dart';

class CalculateButton extends StatelessWidget {
  CalculateButton({this.label, this.doOnTap});

  final String label;
  final Function doOnTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: doOnTap,
      child: Container(
        color: kBottomContainerColor,
        margin: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
