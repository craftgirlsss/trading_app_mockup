import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:valbury_mockup/src/components/styles/text_style.dart';
import 'package:valbury_mockup/src/helpers/variable/global_variable.dart';

class GlobalButtons {
  static CupertinoButton defaultCupertinoButton({Function()? onPressed, String? title}){
    return CupertinoButton(
      color: GlobalVariableColors.primaryColor,
      onPressed: onPressed,
      child: Text(title ?? "Submit", style: GlobalTextStyle.defaultTextStyle(fontWeight: FontWeight.bold, color: CupertinoColors.white))
    );
  }

  static CupertinoButton defaultCupertinoTextButton({Function()? onPressed, String? title}){
    return CupertinoButton(
      onPressed: onPressed,
      child: Text(title ?? "Submit", style: GlobalTextStyle.defaultTextStyle(fontWeight: FontWeight.bold, color: GlobalVariableColors.primaryColor))
    );
  }

  static ElevatedButton defaultElevatedButton({Function()? onPressed, String? title, double? fontSize}){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        backgroundColor: GlobalVariableColors.primaryColor
      ),
      onPressed: onPressed,
      child: Text(title ?? "Submit", style: GlobalTextStyle.defaultTextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: fontSize))
    );
  }

  static OutlinedButton defaultOutlinedButton({Function()? onPressed, String? title, Color? outlineColor, Color? titleColor, FontWeight? fontWeight, double? fontSize}){
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        side: BorderSide(color: outlineColor ?? Colors.white),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      ),
      onPressed: onPressed,
      child: Text(title ?? "Submit", style: GlobalTextStyle.defaultTextStyle(fontWeight: fontWeight ?? FontWeight.bold, color: titleColor ?? Colors.white, fontSize: fontSize ?? 13))
    );
  }
}