import 'package:flutter/material.dart';
import 'package:theme_changer/assets/app_txt_styles.dart';

class AppTextScheme extends ThemeExtension<AppTextScheme> {
  final TextStyle regular12;
  final TextStyle regular12AccentSubtitle;
  final TextStyle regular12Subtitle;
  final TextStyle regular14;
  final TextStyle regular14Label;
  final TextStyle regular14Accent;
  final TextStyle regular16Error;
  final TextStyle regular16;
  final TextStyle bold18;

  const AppTextScheme._({
    required this.regular12,
    required this.regular12AccentSubtitle,
    required this.regular12Subtitle,
    required this.regular14,
    required this.regular14Label,
    required this.regular14Accent,
    required this.regular16Error,
    required this.regular16,
    required this.bold18,
  });

  AppTextScheme.greenLight()
      : regular12 = GreenTextStyleLight.regular12,
        regular12AccentSubtitle = GreenTextStyleLight.regular12AccentSubtitle,
        regular12Subtitle = GreenTextStyleLight.regular12Subtitle,
        regular14 = GreenTextStyleLight.regular14,
        regular14Label = GreenTextStyleLight.regular14Label,
        regular14Accent = GreenTextStyleLight.regular14Accent,
        regular16Error = GreenTextStyleLight.regular16Error,
        regular16 = GreenTextStyleLight.regular16,
        bold18 = GreenTextStyleLight.bold18;
  AppTextScheme.greenDark()
      : regular12 = GreenTextStyleDark.regular12,
        regular12AccentSubtitle = GreenTextStyleDark.regular12AccentSubtitle,
        regular12Subtitle = GreenTextStyleDark.regular12Subtitle,
        regular14 = GreenTextStyleDark.regular14,
        regular14Label = GreenTextStyleDark.regular14Label,
        regular14Accent = GreenTextStyleDark.regular14Accent,
        regular16Error = GreenTextStyleDark.regular16Error,
        regular16 = GreenTextStyleDark.regular16,
        bold18 = GreenTextStyleDark.bold18;

  AppTextScheme.purpleLight()
      : regular12 = PurpleTextStyleLight.regular12,
        regular12AccentSubtitle = PurpleTextStyleLight.regular12AccentSubtitle,
        regular12Subtitle = PurpleTextStyleLight.regular12Subtitle,
        regular14 = PurpleTextStyleLight.regular14,
        regular14Label = PurpleTextStyleLight.regular14Label,
        regular14Accent = PurpleTextStyleLight.regular14Accent,
        regular16Error = PurpleTextStyleLight.regular16Error,
        regular16 = PurpleTextStyleLight.regular16,
        bold18 = PurpleTextStyleLight.bold18;

  AppTextScheme.purpleDark()
      : regular12 = PurpleTextStyleDark.regular12,
        regular12AccentSubtitle = PurpleTextStyleDark.regular12AccentSubtitle,
        regular12Subtitle = PurpleTextStyleDark.regular12Subtitle,
        regular14 = PurpleTextStyleDark.regular14,
        regular14Label = PurpleTextStyleDark.regular14Label,
        regular14Accent = PurpleTextStyleDark.regular14Accent,
        regular16Error = PurpleTextStyleDark.regular16Error,
        regular16 = PurpleTextStyleDark.regular16,
        bold18 = PurpleTextStyleDark.bold18;

  AppTextScheme.orangeLight()
      : regular12 = OrangeTextStyleLight.regular12,
        regular12AccentSubtitle = OrangeTextStyleLight.regular12AccentSubtitle,
        regular12Subtitle = OrangeTextStyleLight.regular12Subtitle,
        regular14 = OrangeTextStyleLight.regular14,
        regular14Label = OrangeTextStyleLight.regular14Label,
        regular14Accent = OrangeTextStyleLight.regular14Accent,
        regular16Error = OrangeTextStyleLight.regular16Error,
        regular16 = OrangeTextStyleLight.regular16,
        bold18 = OrangeTextStyleLight.bold18;

  AppTextScheme.orangeDark()
      : regular12 = OrangeTextStyleDark.regular12,
        regular12AccentSubtitle = OrangeTextStyleDark.regular12AccentSubtitle,
        regular12Subtitle = OrangeTextStyleDark.regular12Subtitle,
        regular14 = OrangeTextStyleDark.regular14,
        regular14Label = OrangeTextStyleDark.regular14Label,
        regular14Accent = OrangeTextStyleDark.regular14Accent,
        regular16Error = OrangeTextStyleDark.regular16Error,
        regular16 = OrangeTextStyleDark.regular16,
        bold18 = OrangeTextStyleDark.bold18;

  @override
  ThemeExtension<AppTextScheme> lerp(
    ThemeExtension<AppTextScheme>? other,
    double t,
  ) {
    if (other is! AppTextScheme) {
      return this;
    }

    return AppTextScheme._(
      regular12: TextStyle.lerp(regular12, other.regular12, t)!,
      regular12AccentSubtitle: TextStyle.lerp(
          regular12AccentSubtitle, other.regular12AccentSubtitle, t)!,
      regular12Subtitle:
          TextStyle.lerp(regular12Subtitle, other.regular12Subtitle, t)!,
      regular14: TextStyle.lerp(regular14, other.regular14, t)!,
      regular14Label: TextStyle.lerp(regular14Label, other.regular14Label, t)!,
      regular14Accent:
          TextStyle.lerp(regular14Accent, other.regular14Accent, t)!,
      regular16Error: TextStyle.lerp(regular16Error, other.regular16Error, t)!,
      regular16: TextStyle.lerp(regular16, other.regular16, t)!,
      bold18: TextStyle.lerp(bold18, other.bold18, t)!,
    );
  }

  static AppTextScheme of(BuildContext context) {
    return Theme.of(context).extension<AppTextScheme>() ??
        _throwThemeExceptionFromFunc(context);
  }

  @override
  AppTextScheme copyWith({
    TextStyle? regular12,
    TextStyle? regular12AccentSubtitle,
    TextStyle? regular12Subtitle,
    TextStyle? regular14,
    TextStyle? regular14Label,
    TextStyle? regular14Accent,
    TextStyle? regular16Error,
    TextStyle? regular16,
    TextStyle? bold18,
  }) {
    return AppTextScheme._(
      regular12: regular12 ?? this.regular12,
      regular12AccentSubtitle:
          regular12AccentSubtitle ?? this.regular12AccentSubtitle,
      regular12Subtitle: regular12Subtitle ?? this.regular12Subtitle,
      regular14: regular14 ?? this.regular14,
      regular14Label: regular14Label ?? this.regular14Label,
      regular14Accent: regular14Accent ?? this.regular14Accent,
      regular16Error: regular16Error ?? this.regular16Error,
      regular16: regular16 ?? this.regular16,
      bold18: bold18 ?? this.bold18,
    );
  }
}

Never _throwThemeExceptionFromFunc(BuildContext context) =>
    throw Exception('$AppTextScheme not found in $context');
