import 'package:finany/common/utils/kcolors.dart';
import 'package:finany/common/widgets/app_style.dart';
import 'package:flutter/material.dart';

class FTextTheme {
  FTextTheme._();
  
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: appStyle(32, Kolors.kDark, FontWeight.bold),
    headlineMedium: appStyle(24, Kolors.kDark, FontWeight.w600),
  );
  static TextTheme darkTextTheme = TextTheme(
     headlineLarge: appStyle(32, Kolors.kWhite, FontWeight.bold),
    headlineMedium: appStyle(24, Kolors.kWhite, FontWeight.w600),
  );
}