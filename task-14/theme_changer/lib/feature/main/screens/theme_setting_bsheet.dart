import 'package:flutter/material.dart';
import 'package:theme_changer/assets/app_txt_scheme.dart';
import 'package:theme_changer/extensions/theme_mode.dart';
import 'package:theme_changer/feature/main/theme/theme_inherited.dart';
import 'package:theme_changer/feature/main/widgets/cup_radio_tile.dart';
import 'package:theme_changer/feature/main/widgets/scheme_selector.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeSettingsBottomSheet extends StatelessWidget {
  const ThemeSettingsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final themeInherited = ThemeInherited.of(context);
    final localization = AppLocalizations.of(context)!;
    return ValueListenableBuilder(
      valueListenable: themeInherited.themeMode,
      builder: (context, themeMode, _) => Container(
        height: 380,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    localization.profilePageThemeLabel,
                    style: AppTextScheme.of(context).bold18,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(Icons.close),
                  ),
                ],
              ),
            ),
            CupertinoRadioTile(
              value: ThemeMode.system,
              groupValue: themeMode,
              label: ThemeMode.system.label,
              onChanged: (value) {
                themeInherited.setThemeMode(ThemeMode.system);
              },
            ),
            CupertinoRadioTile(
              value: ThemeMode.light,
              groupValue: themeMode,
              label: ThemeMode.light.label,
              onChanged: (value) {
                themeInherited.setThemeMode(ThemeMode.light);
              },
            ),
            Visibility(
              visible: themeMode == ThemeMode.light,
              child: const SchemeSelector(),
            ),
            CupertinoRadioTile(
              value: ThemeMode.dark,
              groupValue: themeMode,
              label: ThemeMode.dark.label,
              onChanged: (value) {
                themeInherited.setThemeMode(ThemeMode.dark);
              },
            ),
            Visibility(
              visible: themeMode == ThemeMode.dark,
              child: const SchemeSelector(),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(localization.done),
            ),
          ],
        ),
      ),
    );
  }
}