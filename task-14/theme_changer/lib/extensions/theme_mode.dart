import 'package:flutter/material.dart';

extension ThemeModeX on ThemeMode {
  String get label => switch (this) {
        ThemeMode.light => 'Светлая',
        ThemeMode.dark => 'Темная',
        ThemeMode.system => 'Системная',
      };
}
