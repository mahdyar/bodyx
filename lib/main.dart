import 'dart:async';

import 'package:flutter/material.dart';
import 'package:bodyx/pages/MainPage.dart';
import 'package:bodyx/constants.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bodyx',
      theme: ThemeData(
        primaryColor: kMainColor,
        scaffoldBackgroundColor: kMainColor,
        textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
        fontFamily: 'IRANYekan',
      ),
      home: MainPage(title: 'بادیکس | شاخص توده بدنی'),
    );
  }
}
