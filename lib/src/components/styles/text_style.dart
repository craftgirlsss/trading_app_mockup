import 'package:flutter/material.dart';

class GlobalTextStyle {
  static TextStyle defaultTextStyle({Color? color, double? fontSize, FontWeight? fontWeight}){
    return TextStyle(
      fontFamily: "Poppins",
      color: color ?? Colors.black,
      fontSize: fontSize ?? 14,
      fontWeight: fontWeight ?? FontWeight.normal
    );
  }
}