import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_changer/assets/app_theme/app_theme_data.dart';

abstract interface class IThemeLocalDatasource {
  Future<void> setThemeMode({
    required final ThemeMode themeMode,
  });

  ThemeMode? getThemeMode();

  Future<void> setThemeData({
    required final AppThemeDataName themeDataName,
  });

  AppThemeDataName? getThemeData();
}

class ThemeLocalDatasource implements IThemeLocalDatasource {
  ThemeLocalDatasource({
    required this.prefs,
  });

  final SharedPreferences prefs;

  @override
  AppThemeDataName? getThemeData() {
    try {
      final storedName = prefs.getString(
        ThemeStorageKeys.appTheme.key,
      );
      if (storedName?.isEmpty ?? true) return null;
      return AppThemeDataName.values.firstWhereOrNull(
        (themeDataName) => themeDataName.name == storedName,
      );
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  @override
  ThemeMode? getThemeMode() {
    try {
      final storedThemeMode = prefs.getString(ThemeStorageKeys.mode.key);

      if (storedThemeMode?.isEmpty ?? true) return null;

      return ThemeMode.values.firstWhereOrNull(
        (themeMode) => themeMode.name == storedThemeMode,
      );
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  @override
  Future<void> setThemeData({
    required AppThemeDataName themeDataName,
  }) async {
    try {
      await prefs.setString(
        ThemeStorageKeys.appTheme.key,
        themeDataName.name,
      );
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  @override
  Future<void> setThemeMode({
    required ThemeMode themeMode,
  }) async {
    try {
      await prefs.setString(ThemeStorageKeys.mode.key, themeMode.name);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

}

enum ThemeStorageKeys {
  mode('theme_mode'),
  appTheme('app_theme');

  final String key;

  const ThemeStorageKeys(this.key);
}
