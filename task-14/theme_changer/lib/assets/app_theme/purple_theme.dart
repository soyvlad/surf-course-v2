import 'package:theme_changer/assets/app_scheme_colors.dart';
import 'package:theme_changer/assets/app_theme/app_theme_data.dart';
import 'package:theme_changer/assets/app_txt_scheme.dart';
import 'package:flutter/material.dart';

class PurpleAppThemeData implements AppThemeData {
// Light purple theme config.
  @override
  final light = ThemeData(
    fontFamily: 'SF-Pro-Display',
    primaryColor: _purpleLightColorScheme.primary,
    scaffoldBackgroundColor: _purpleLightColorScheme.scaffoldBackground,
    highlightColor: _purpleLightColorScheme.schemeSecondPreviewColor,
    focusColor: _purpleLightColorScheme.schemeThirdPreviewColor,
    hintColor: _purpleLightColorScheme.schemeFourthPreviewColor,
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: _purpleLightColorScheme.bottomSheetBackground,
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: _purpleTextSchemeLight.bold18,
      iconTheme: IconThemeData(
        color: _purpleLightColorScheme.primary,
      ),
      backgroundColor: _purpleLightColorScheme.scaffoldBackground,
    ),
    iconTheme: IconThemeData(
      color: _purpleLightColorScheme.primary,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
        foregroundColor: _purpleLightColorScheme.outlinedButtonForegroundColor,
        textStyle: _purpleTextSchemeLight.regular16Error,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
        foregroundColor: _purpleLightColorScheme.elevatedButtonForegroundColor,
        backgroundColor: _purpleLightColorScheme.elevatedButtonBackgroundColor,
        textStyle: _purpleTextSchemeLight.regular16Error,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
    extensions: [_purpleLightColorScheme, _purpleTextSchemeLight],
    brightness: Brightness.light,
  );

// Dark purple theme config.
  @override
  final dark = ThemeData(
    fontFamily: 'SF-Pro-Display',
    primaryColor: _purpleDarkColorScheme.primary,
    scaffoldBackgroundColor: _purpleDarkColorScheme.scaffoldBackground,
    highlightColor: _purpleDarkColorScheme.schemeSecondPreviewColor,
    focusColor: _purpleDarkColorScheme.schemeThirdPreviewColor,
    hintColor: _purpleDarkColorScheme.schemeFourthPreviewColor,
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: _purpleDarkColorScheme.bottomSheetBackground,
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: _purpleTextSchemeDark.bold18,
      iconTheme: IconThemeData(
        color: _purpleDarkColorScheme.primary,
      ),
      backgroundColor: _purpleDarkColorScheme.scaffoldBackground,
    ),
    iconTheme: IconThemeData(
      color: _purpleDarkColorScheme.primary,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
        foregroundColor: _purpleDarkColorScheme.outlinedButtonForegroundColor,
        textStyle: _purpleTextSchemeDark.regular16Error,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
        foregroundColor: _purpleDarkColorScheme.elevatedButtonForegroundColor,
        backgroundColor: _purpleDarkColorScheme.elevatedButtonBackgroundColor,
        textStyle: _purpleTextSchemeDark.regular16Error,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
    extensions: [_purpleDarkColorScheme, _purpleTextSchemeDark],
    brightness: Brightness.light,
  );

  static final AppColorScheme _purpleLightColorScheme =
      AppColorScheme.purpleLight();
  static final AppColorScheme _purpleDarkColorScheme =
      AppColorScheme.purpleDark();

  static final _purpleTextSchemeLight = AppTextScheme.purpleLight();
  static final _purpleTextSchemeDark = AppTextScheme.purpleDark();

  @override
  final name = AppThemeDataName.purple;
}
