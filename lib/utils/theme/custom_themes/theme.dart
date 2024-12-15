import 'package:flutter/material.dart';

import 'botton_sheet_theme.dart';
import 'checkbox_theme.dart';
import 'chip_theme.dart';
import 'elevated_botton_theme.dart';

import 'text_theme.dart';
import 'appbar_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xFFFAF3EB),
    // useMaterial3: true,
    // brightness: Brightness.light,
    // primaryColor: Color(0xFF4A7C4A),
    // textTheme: TTextTheme.LightTextTheme,
    // // chipTheme: TChipTheme.LightChipTheme,
    // appBarTheme: TAppBarTheme.LightAppBarTheme,
    // checkboxTheme: TCheckboxTheme.LightCheckboxTheme,
    // bottomSheetTheme: TBottomSheetTheme.LightBottomSheetTheme,
    // elevatedButtonTheme: TElevatedButtonTheme.LightElevatedButtonTheme,
  );

  static ThemeData darkTheme = ThemeData(
      // scaffoldBackgroundColor: Colors.black,
      // useMaterial3: true,
      // brightness: Brightness.dark,
      // primaryColor: Color(0xFF0a9f95),
      // textTheme: TTextTheme.DarkTextTheme,
      // chipTheme: TChipTheme.DarkChipTheme,
      // appBarTheme: TAppBarTheme.DarkAppBarTheme,
      // checkboxTheme: TCheckboxTheme.DarkCheckboxTheme,
      // bottomSheetTheme: TBottomSheetTheme.DarkBottomSheetTheme,
      // elevatedButtonTheme: TElevatedButtonTheme.DarkElevatedButtonTheme,
      );
}
