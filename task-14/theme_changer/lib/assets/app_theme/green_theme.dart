import 'package:flutter/material.dart';
import 'package:theme_changer/assets/app_scheme_colors.dart';
import 'package:theme_changer/assets/app_theme/app_theme_data.dart';
import 'package:theme_changer/assets/app_txt_scheme.dart';

class GreenAppThemeData implements AppThemeData {
// Light green theme config.
  @override
  final light = ThemeData(
    fontFamily: 'SF-Pro-Display',
    primaryColor: _greenLightColorScheme.primary,
    scaffoldBackgroundColor: _greenLightColorScheme.scaffoldBackground,
    highlightColor: _greenLightColorScheme.schemeSecondPreviewColor,
    focusColor: _greenLightColorScheme.schemeThirdPreviewColor,
    hintColor: _greenLightColorScheme.schemeFourthPreviewColor,
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: _greenLightColorScheme.bottomSheetBackground,
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: _greenTextSchemeLight.bold18,
      iconTheme: IconThemeData(
        color: _greenLightColorScheme.primary,
      ),
      backgroundColor: _greenLightColorScheme.scaffoldBackground,
    ),
    iconTheme: IconThemeData(
      color: _greenLightColorScheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
        foregroundColor: _greenLightColorScheme.elevatedButtonForegroundColor,
        backgroundColor: _greenLightColorScheme.elevatedButtonBackgroundColor,
        textStyle: _greenTextSchemeLight.regular16Error,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
        foregroundColor: _greenLightColorScheme.outlinedButtonForegroundColor,
        textStyle: _greenTextSchemeLight.regular16Error,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
    extensions: [_greenLightColorScheme, _greenTextSchemeLight],
    brightness: Brightness.light,
  );

// Dark green theme config.
  @override
  final dark = ThemeData(
    fontFamily: 'SF-Pro-Display',
    primaryColor: _greenDarkColorScheme.primary,
    scaffoldBackgroundColor: _greenDarkColorScheme.scaffoldBackground,
    highlightColor: _greenDarkColorScheme.schemeSecondPreviewColor,
    focusColor: _greenDarkColorScheme.schemeThirdPreviewColor,
    hintColor: _greenDarkColorScheme.schemeFourthPreviewColor,
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: _greenDarkColorScheme.bottomSheetBackground,
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: _greenTextSchemeDark.bold18,
      iconTheme: IconThemeData(
        color: _greenDarkColorScheme.primary,
      ),
      backgroundColor: _greenDarkColorScheme.scaffoldBackground,
    ),
    iconTheme: IconThemeData(
      color: _greenDarkColorScheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
        foregroundColor: _greenDarkColorScheme.elevatedButtonForegroundColor,
        backgroundColor: _greenDarkColorScheme.elevatedButtonBackgroundColor,
        textStyle: _greenTextSchemeLight.regular16Error,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
        foregroundColor: _greenDarkColorScheme.outlinedButtonForegroundColor,
        textStyle: _greenTextSchemeDark.regular16Error,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
    extensions: [_greenDarkColorScheme, _greenTextSchemeDark],
  );

  static final AppColorScheme _greenLightColorScheme =
      AppColorScheme.greenLight();
  static final AppColorScheme _greenDarkColorScheme =
      AppColorScheme.greenDark();

  static final _greenTextSchemeLight = AppTextScheme.greenLight();
  static final _greenTextSchemeDark = AppTextScheme.greenDark();

  @override
  final name = AppThemeDataName.green;
}
