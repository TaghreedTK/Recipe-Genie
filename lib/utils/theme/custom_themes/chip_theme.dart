import 'package:flutter/material.dart';

class TChipTheme {
  TChipTheme._();

  static ChipThemeData LightChipTheme = ChipThemeData(
    disabledColor: Color(0xFFC6B9A9),
    labelStyle: const TextStyle(color: Colors.black),
    selectedColor: Color(0xFF0a9f95),
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: Colors.white,
  );

  static ChipThemeData DarkChipTheme = ChipThemeData(
    disabledColor: Colors.grey,
    labelStyle: const TextStyle(color: Colors.white),
    selectedColor: Color(0xFF0a9f95),
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: Colors.white,
  );
}
