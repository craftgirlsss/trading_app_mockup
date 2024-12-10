import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:valbury_mockup/src/helpers/variable/global_variable.dart';

AnnotatedRegion defaultAnnotatedRegion({Widget? child}){
  return  AnnotatedRegion(
    value: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarContrastEnforced: true,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarColor: GlobalVariableColors.primaryColor
    ),
    child: child!
  );
}