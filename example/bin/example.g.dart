// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// ProjectExtensionsGenerator
// **************************************************************************

mixin _AppExtensionsMixin {
  static const double p4 = 4;

  static const double p8 = 8;

  static const double p12 = 12;

  static const double p16 = 16;

  static const double p20 = 20;

  static const double p24 = 24;

  static const double p32 = 32;

  static const double p48 = 48;

  static const double p64 = 64;

  static const double p80 = 80;
}

/// Constant horizontal gaps

const hGap4 = SizedBox(width: _AppExtensionsMixin.p4);

const hGap8 = SizedBox(width: _AppExtensionsMixin.p8);

const hGap12 = SizedBox(width: _AppExtensionsMixin.p12);

const hGap16 = SizedBox(width: _AppExtensionsMixin.p16);

const hGap20 = SizedBox(width: _AppExtensionsMixin.p20);

const hGap24 = SizedBox(width: _AppExtensionsMixin.p24);

const hGap32 = SizedBox(width: _AppExtensionsMixin.p32);

const hGap48 = SizedBox(width: _AppExtensionsMixin.p48);

const hGap64 = SizedBox(width: _AppExtensionsMixin.p64);

const hGap80 = SizedBox(width: _AppExtensionsMixin.p80);

/// Constant vertical gaps

const vGap4 = SizedBox(height: _AppExtensionsMixin.p4);

const vGap8 = SizedBox(height: _AppExtensionsMixin.p8);

const vGap12 = SizedBox(height: _AppExtensionsMixin.p12);

const vGap16 = SizedBox(height: _AppExtensionsMixin.p16);

const vGap20 = SizedBox(height: _AppExtensionsMixin.p20);

const vGap24 = SizedBox(height: _AppExtensionsMixin.p24);

const vGap32 = SizedBox(height: _AppExtensionsMixin.p32);

const vGap48 = SizedBox(height: _AppExtensionsMixin.p48);

const vGap64 = SizedBox(height: _AppExtensionsMixin.p64);

const vGap80 = SizedBox(height: _AppExtensionsMixin.p80);

// Vertical Paddings

const vPadding4 = EdgeInsets.symmetric(vertical: _AppExtensionsMixin.p4);

const vPadding8 = EdgeInsets.symmetric(vertical: _AppExtensionsMixin.p8);

const vPadding12 = EdgeInsets.symmetric(vertical: _AppExtensionsMixin.p12);

const vPadding16 = EdgeInsets.symmetric(vertical: _AppExtensionsMixin.p16);

const vPadding20 = EdgeInsets.symmetric(vertical: _AppExtensionsMixin.p20);

const vPadding24 = EdgeInsets.symmetric(vertical: _AppExtensionsMixin.p24);

const vPadding32 = EdgeInsets.symmetric(vertical: _AppExtensionsMixin.p32);

const vPadding48 = EdgeInsets.symmetric(vertical: _AppExtensionsMixin.p48);

const vPadding64 = EdgeInsets.symmetric(vertical: _AppExtensionsMixin.p64);

const vPadding80 = EdgeInsets.symmetric(vertical: _AppExtensionsMixin.p80);

// Horizontal Paddings

const hPadding4 = EdgeInsets.symmetric(horizontal: _AppExtensionsMixin.p4);

const hPadding8 = EdgeInsets.symmetric(horizontal: _AppExtensionsMixin.p8);

const hPadding12 = EdgeInsets.symmetric(horizontal: _AppExtensionsMixin.p12);

const hPadding16 = EdgeInsets.symmetric(horizontal: _AppExtensionsMixin.p16);

const hPadding20 = EdgeInsets.symmetric(horizontal: _AppExtensionsMixin.p20);

const hPadding24 = EdgeInsets.symmetric(horizontal: _AppExtensionsMixin.p24);

const hPadding32 = EdgeInsets.symmetric(horizontal: _AppExtensionsMixin.p32);

const hPadding48 = EdgeInsets.symmetric(horizontal: _AppExtensionsMixin.p48);

const hPadding64 = EdgeInsets.symmetric(horizontal: _AppExtensionsMixin.p64);

const hPadding80 = EdgeInsets.symmetric(horizontal: _AppExtensionsMixin.p80);

// All Paddings

const allPadding4 = EdgeInsets.all(_AppExtensionsMixin.p4);

const allPadding8 = EdgeInsets.all(_AppExtensionsMixin.p8);

const allPadding12 = EdgeInsets.all(_AppExtensionsMixin.p12);

const allPadding16 = EdgeInsets.all(_AppExtensionsMixin.p16);

const allPadding20 = EdgeInsets.all(_AppExtensionsMixin.p20);

const allPadding24 = EdgeInsets.all(_AppExtensionsMixin.p24);

const allPadding32 = EdgeInsets.all(_AppExtensionsMixin.p32);

const allPadding48 = EdgeInsets.all(_AppExtensionsMixin.p48);

const allPadding64 = EdgeInsets.all(_AppExtensionsMixin.p64);

const allPadding80 = EdgeInsets.all(_AppExtensionsMixin.p80);

class AppColorsTheme extends ThemeExtension<AppColorsTheme> {
  AppColorsTheme({
    required this.primary900,
    required this.primary800,
    required this.primary700,
    required this.primary600,
    required this.primary500,
    required this.primary400,
  });

  final Color primary900;

  final Color primary800;

  final Color primary700;

  final Color primary600;

  final Color primary500;

  final Color primary400;

  @override
  AppColorsTheme copyWith({
    Color? primary900,
    Color? primary800,
    Color? primary700,
    Color? primary600,
    Color? primary500,
    Color? primary400,
  }) =>
      AppColorsTheme(
        primary900: primary900 ?? this.primary900,
        primary800: primary800 ?? this.primary800,
        primary700: primary700 ?? this.primary700,
        primary600: primary600 ?? this.primary600,
        primary500: primary500 ?? this.primary500,
        primary400: primary400 ?? this.primary400,
      );

  @override
  ThemeExtension<AppColorsTheme> lerp(
    covariant ThemeExtension<AppColorsTheme>? other,
    double t,
  ) {
    if (other is! AppColorsTheme) {
      return this;
    }
    return AppColorsTheme(
      primary900: Color.lerp(
        primary900,
        other.primary900,
        t,
      )!,
      primary800: Color.lerp(
        primary800,
        other.primary800,
        t,
      )!,
      primary700: Color.lerp(
        primary700,
        other.primary700,
        t,
      )!,
      primary600: Color.lerp(
        primary600,
        other.primary600,
        t,
      )!,
      primary500: Color.lerp(
        primary500,
        other.primary500,
        t,
      )!,
      primary400: Color.lerp(
        primary400,
        other.primary400,
        t,
      )!,
    );
  }
}

final appColorsTheme = AppColorsTheme(
  primary900: AppExtensions.primary900,
  primary800: AppExtensions.primary800,
  primary700: AppExtensions.primary700,
  primary600: AppExtensions.primary600,
  primary500: AppExtensions.primary500,
  primary400: AppExtensions.primary400,
);
