import 'package:flutter/material.dart';
import 'package:valbury_mockup/src/components/styles/text_style.dart';
import 'package:valbury_mockup/src/helpers/variable/global_variable.dart';

class GlobalAppBar {
  static AppBar defaultAppBar({String? title, List<Widget>? actions, Color? iconColor}){
    return AppBar(
      forceMaterialTransparency: true,
      backgroundColor: GlobalVariableColors.backGroundColor,
      elevation: 0,
      iconTheme: IconThemeData(color: iconColor ?? GlobalVariableColors.primaryColor),
      title: Text(title ?? "App Bar", style: GlobalTextStyle.defaultTextStyle(fontWeight: FontWeight.bold, color: iconColor ?? Colors.black)),
      actions: actions,
    );
  }
}