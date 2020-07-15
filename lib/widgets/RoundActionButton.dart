import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bodyx/constants.dart';

class RoundActionButton extends StatelessWidget {
  RoundActionButton({@required this.icon, @required this.doOnPress});
  final IconData icon;
  final Function doOnPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: doOnPress,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: kRabSize,
        height: kRabSize,
      ),
      shape:CircleBorder(),
      fillColor: kRabColor,
      child: Icon(
        icon,
        size: 32.0,
        color: Colors.white,
      ),
    );
  }
}
