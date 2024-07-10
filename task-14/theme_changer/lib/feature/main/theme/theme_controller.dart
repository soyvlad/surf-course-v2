import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:theme_changer/assets/app_theme/app_theme_data.dart';
import 'package:theme_changer/assets/app_theme/green_theme.dart';
import 'package:theme_changer/assets/app_theme/orange_theme.dart';
import 'package:theme_changer/assets/app_theme/purple_theme.dart';
import 'package:theme_changer/feature/main/data/repo/theme_repo.dart';

class ThemeController {
  final IThemeRepository _themeRepository;

  ThemeController({
    required IThemeRepository themeRepository,
  }) : _themeRepository = themeRepository;

  late final ValueNotifier<ThemeMode> _themeMode = ValueNotifier<ThemeMode>(
    _themeRepository.getThemeMode() ?? ThemeMode.system,
  );
  late final ValueNotifier<AppThemeData> _themeData =
      ValueNotifier<AppThemeData>(_getStoredThemeData() ?? _greenAppTheme);

  final _greenAppTheme = GreenAppThemeData();
  final _purpleAppTheme = PurpleAppThemeData();
  final _orangeAppTheme = OrangeAppThemeData();

  ValueListenable<ThemeMode> get themeMode => _themeMode;

  ValueListenable<AppThemeData> get themeData => _themeData;

  List<AppThemeData> get appThemes => [
        _greenAppTheme,
        _purpleAppTheme,
        _orangeAppTheme,
      ];

  AppThemeData? _getStoredThemeData() {
    final themeData = _themeRepository.getThemeData();
    return switch (themeData) {
      AppThemeDataName.green => _greenAppTheme,
      AppThemeDataName.purple => _purpleAppTheme,
      AppThemeDataName.orange => _orangeAppTheme,
      null => null,
    };
  }

  Future<void> setThemeMode(ThemeMode newThemeMode) async {
    if (newThemeMode == _themeMode.value) return;
    await _themeRepository.setThemeMode(themeMode: newThemeMode);
    if (newThemeMode == ThemeMode.system) {
      setThemeData(appThemes.first);
    }
    _themeMode.value = newThemeMode;
  }

  Future<void> setThemeData(AppThemeData newThemeData) async {
    if (newThemeData == _themeData.value) return;
    await _themeRepository.setThemeData(themeDataName: newThemeData.name);
    _themeData.value = newThemeData;
  }
}
