import 'package:extensions_builder/project_extensions.dart';
import 'package:flutter/material.dart';
part 'example.g.dart';

@ProjectExtensions(steps: [4, 8, 12, 16, 20, 24, 32, 48, 64, 80])
class AppExtensions with _AppExtensionsMixin {

  // primary900Color Swatch
  static const primary900 = Color(0xff480e11);
  // primary800 Color Swatch
  static const primary800 = Color(0xff73171a);
  // primary700Color Swatch
  static const primary700 = Color(0xff9d1f24);
  // primary600 Color Swatch
  static const primary600 = Color(0xffc8282e);
  // primary500 Color Swatch
  static const primary500 = Color(0xffda484e);
  // primary400Color Swatch
  static const primary400 = Color(0xffe37377);

}




void main() {
  final t = AppExtensions();

  appColorsTheme.copyWith(
    primary400: AppExtensions.primary400,
  );
}