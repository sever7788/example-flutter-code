import 'package:flutter/material.dart';

class WFonts {
  static TextStyle regular = const TextStyle(fontWeight: FontWeight.w400);
  static TextStyle medium = const TextStyle(fontWeight: FontWeight.w500);
  static TextStyle semiBold = const TextStyle(fontWeight: FontWeight.w600);
  static TextStyle bold = const TextStyle(fontWeight: FontWeight.w700);
  static TextStyle extraBold = const TextStyle(fontWeight: FontWeight.w800);
}

class WTextStyles {
  static TextStyle header0 = WFonts.medium.copyWith(fontSize: 30, height: 36 / 30);
  static TextStyle header1 = WFonts.bold.copyWith(fontSize: 36, height: 1);
  static TextStyle body2 = WFonts.bold.copyWith(fontSize: 16, height: 22 / 16);
  static TextStyle caption = WFonts.regular.copyWith(fontSize: 13, height: 15 / 13);
  static TextStyle caption1 = WFonts.semiBold.copyWith(fontSize: 12, height: 14 / 12);
  static TextStyle caption2 = WFonts.medium.copyWith(fontSize: 12, height: 14 / 12);
  static TextStyle subtitle = WFonts.bold.copyWith(fontSize: 17, height: 19 / 17);
  static TextStyle subtitle1 = WFonts.medium.copyWith(fontSize: 13, height: 15 / 13);
  static TextStyle little1 = WFonts.medium.copyWith(fontSize: 8, height: 10 / 8);
}
