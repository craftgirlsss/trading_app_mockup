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

  static AppBar appbarMainPage({List<Widget>? actions, Color? iconColor, Widget? leading}){
    return AppBar(
      backgroundColor: Colors.white,
      forceMaterialTransparency: true,
      elevation: 0,
      leadingWidth: 200,
      leading: leading,
      iconTheme: IconThemeData(color: iconColor ?? GlobalVariableColors.primaryColor),
      actions: actions,
    );
  }


  static AppBar appbarMarket({var bottom, List<Widget>? actions, Color? iconColor, Widget? leading, double? toolbarHeight}){
    return AppBar(
      toolbarHeight: toolbarHeight,
      backgroundColor: Colors.white,
      forceMaterialTransparency: true,
      bottom: bottom,
      elevation: 0,
      leadingWidth: 200,
      leading: leading,
      iconTheme: IconThemeData(color: iconColor ?? GlobalVariableColors.primaryColor),
      actions: actions,
    );
  }

  static AppBar appBarChatTab({var bottom, List<Widget>? actions, Color? iconColor, Widget? leading, double? toolbarHeight, String? title}){
    return AppBar(
      toolbarHeight: toolbarHeight,
      backgroundColor: Colors.white,
      forceMaterialTransparency: true,
      bottom: bottom,
      elevation: 0,
      title: const Text("Customer Service"),
      leading: leading,
      iconTheme: IconThemeData(color: iconColor ?? GlobalVariableColors.primaryColor),
      actions: actions,
    );
  }
}