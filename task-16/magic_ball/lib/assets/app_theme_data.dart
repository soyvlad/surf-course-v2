import 'package:flutter/material.dart';
import 'package:magic_ball/assets/app_colors.dart';
import 'package:magic_ball/assets/app_text_style.dart';

abstract class AppThemeData {
  static final ThemeData lightTheme = ThemeData(
    textTheme: AppTextTheme.appTextTheme,
    appBarTheme: const AppBarTheme(
      foregroundColor: AppColors.black,
      color: AppColors.white,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: AppColors.darkBlue,
    useMaterial3: true,
  );
}
