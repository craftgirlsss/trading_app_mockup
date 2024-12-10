import 'package:flutter/material.dart';

class GlobalVariableColors {
  static const backGroundColor = Colors.white;
  static const textColor = Colors.black;
  static Color textColorWithOpacity = Colors.black.withOpacity(0.6);
  static Color loadingColor = Colors.black.withOpacity(0.6);
  static const loadingColorInsideButton = Color.fromRGBO(255, 255, 255, 1);
  static const primaryColor = Color.fromRGBO(157, 198, 67, 1);
  static const backgroundSnackBar = Colors.white;
  static var gradientColor = [
    const Color.fromRGBO(0, 91, 170, 1).withOpacity(0.5),
    const Color.fromRGBO(0, 91, 170, 1).withOpacity(0.7),
    const Color.fromRGBO(0, 91, 170, 1).withOpacity(0.9),
    const Color.fromRGBO(0, 91, 170, 1),
  ];
}

class GlobalDefaultText {
  static const appName = "All Media Indo FX";
}