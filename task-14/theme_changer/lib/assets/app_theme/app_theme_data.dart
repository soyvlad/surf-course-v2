import 'package:flutter/material.dart';

abstract class AppThemeData {
  ThemeData get light;
  AppThemeDataName get name;
  ThemeData get dark;
}

enum AppThemeDataName {
  green,
  purple,
  orange,
}
