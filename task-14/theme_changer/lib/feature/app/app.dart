import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:theme_changer/feature/main/screens/profile_screen.dart';
import 'package:theme_changer/feature/main/theme/theme_controller.dart';
import 'package:theme_changer/feature/main/theme/theme_inherited.dart';
import 'package:theme_changer/feature/main/widgets/theme_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.themeController,
  });

  final ThemeController themeController;

  @override
  Widget build(BuildContext context) {
    return ThemeInherited(
      themeController: themeController,
      child: ThemeBuilder(
        builder: (_, themeMode, themeData) => MaterialApp(
          theme: themeData.light,
          darkTheme: themeData.dark,
          themeMode: themeMode,

          // Localization.
          locale: _localizations.firstOrNull,
          localizationsDelegates: _localizationsDelegates,
          supportedLocales: _localizations,
          home: const ProfilePage(),
        ),
      ),
    );
  }
}

const _localizations = [
  Locale('ru', 'RU'),
];

const _localizationsDelegates = [
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];
