import 'package:finany/common/utils/kcolors.dart';
import 'package:finany/common/widgets/app_style.dart';
import 'package:flutter/material.dart';

class FElevatedButton {
  FElevatedButton._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: Kolors.kPrimaryLight,
      foregroundColor: Kolors.kWhite,
      disabledBackgroundColor: Kolors.kGrayLight,
      side: BorderSide(color: Kolors.kPrimaryLight),
      padding: EdgeInsets.symmetric(vertical: 18),
      textStyle: appStyle(16, Kolors.kWhite, FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: Kolors.kOffWhite,
      foregroundColor: Kolors.kPrimaryLight,
      disabledBackgroundColor: Kolors.kGrayLight,
      side: BorderSide(color: Kolors.kGrayLight),
      padding: EdgeInsets.symmetric(vertical: 18),
      textStyle: appStyle(16, Kolors.kWhite, FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}