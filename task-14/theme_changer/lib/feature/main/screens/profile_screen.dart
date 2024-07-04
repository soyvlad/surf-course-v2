import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:theme_changer/assets/app_scheme_colors.dart';
import 'package:theme_changer/assets/app_txt_scheme.dart';
import 'package:theme_changer/assets/resources.dart';
import 'package:theme_changer/extensions/theme_mode.dart';
import 'package:theme_changer/feature/main/mock/user_profile.dart';
import 'package:theme_changer/feature/main/screens/theme_setting_bsheet.dart';
import 'package:theme_changer/feature/main/theme/theme_inherited.dart';
import 'package:theme_changer/feature/main/widgets/info_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextScheme.of(context);
    final colorScheme = AppColorScheme.of(context);
    final localization = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(localization.profilePageAppBar),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              localization.save,
              style: textTheme.regular14Accent,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 24),
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(Images.person),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppColorScheme.of(context).photoFilter,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        localization.edit,
                        style: textTheme.regular12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                localization.profilePageMyRegards,
                style: textTheme.regular14Label,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Image.asset(Images.firstPlace),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Image.asset(Images.firstPlace),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Image.asset(Images.thirdPlace),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Image.asset(Images.secondPlace),
                  ),
                  Image.asset(Images.thirdPlace),
                ],
              ),
            ),
            InfoFieldItem(
              text: user.name,
              label: localization.profilePageNameLabel,
            ),
            InfoFieldItem(
              text: user.email,
              label: localization.profilePageEmailLabel,
            ),
            InfoFieldItem(
              text: DateFormat('dd.MM.yyyy').format(user.birthday),
              label: localization.profilePageDateLabel,
            ),
            InfoFieldItem(
              text: user.team,
              label: localization.profilePageTeamLabel,
              hasArrow: true,
            ),
            InfoFieldItem(
              text: user.position,
              label: localization.profilePagePositionLabel,
              hasArrow: true,
            ),
            InfoFieldItem(
              text: ThemeInherited.of(context).themeMode.value.label,
              label: localization.profilePageThemeLabel,
              hasArrow: true,
              onTap: () {
                showModalBottomSheet(
                  barrierColor: colorScheme.barrierColor,
                  context: context,
                  builder: (context) => const ThemeSettingsBottomSheet(),
                );
              },
            ),
            const Spacer(),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  width: 1,
                  color: colorScheme.outlinedButtonBackgroundColor,
                ),
              ),
              child: Text(localization.logOut),
            ),
          ],
        ),
      ),
    );
  }
}