import 'package:flutter/material.dart';
import 'package:theme_changer/assets/colors_pallete.dart';


/// App color schemes
@immutable
class AppColorScheme extends ThemeExtension<AppColorScheme> {

  final Color primary;

  final Color scaffoldBackground;

  final Color onBackground;

  final Color bottomSheetBackground;

  final Color schemeButtonBg;

  final Color elevatedButtonBackgroundColor;

  final Color elevatedButtonForegroundColor;

  final Color outlinedButtonBackgroundColor;

  final Color outlinedButtonForegroundColor;

  final Color barrierColor;

  final Color photoFilter;

  final Color schemeSecondPreviewColor;

  final Color schemeThirdPreviewColor;

  final Color schemeFourthPreviewColor;

  /// Base color theme version.
  AppColorScheme.greenLight()
      : primary = GreenColorPaletteLight.alienArmpit,
        scaffoldBackground = GreenColorPaletteLight.white,
        schemeButtonBg = GreenColorPaletteLight.cultured,
        onBackground = GreenColorPaletteLight.lotion,
        bottomSheetBackground = GreenColorPaletteLight.white,
        elevatedButtonBackgroundColor = GreenColorPaletteLight.hanPurple,
        elevatedButtonForegroundColor = GreenColorPaletteLight.white,
        outlinedButtonBackgroundColor = GreenColorPaletteLight.coralRed,
        outlinedButtonForegroundColor = GreenColorPaletteLight.coralRed,
        barrierColor = GreenColorPaletteLight.raisinBlack.withOpacity(0.6),
        schemeSecondPreviewColor = GreenColorPaletteLight.sonicSilver,
        schemeThirdPreviewColor = GreenColorPaletteLight.white,
        schemeFourthPreviewColor = GreenColorPaletteLight.sonicSilver,
        photoFilter = GreenColorPaletteLight.raisinBlack.withOpacity(0.4);

  AppColorScheme.greenDark()
      : primary = GreenColorPaletteDark.alienArmpit,
        scaffoldBackground = GreenColorPaletteDark.black,
        schemeButtonBg = GreenColorPaletteDark.charlestonGreen,
        onBackground = GreenColorPaletteDark.raisinBlack,
        bottomSheetBackground = GreenColorPaletteDark.raisinBlack,
        elevatedButtonBackgroundColor = GreenColorPaletteDark.hanPurple,
        elevatedButtonForegroundColor = GreenColorPaletteDark.white,
        outlinedButtonBackgroundColor = GreenColorPaletteDark.coralRed,
        outlinedButtonForegroundColor = GreenColorPaletteDark.coralRed,
        barrierColor = GreenColorPaletteDark.black.withOpacity(0.6),
        schemeSecondPreviewColor = GreenColorPaletteDark.sonicSilver,
        schemeThirdPreviewColor = GreenColorPaletteDark.white,
        schemeFourthPreviewColor = GreenColorPaletteDark.sonicSilver,
        photoFilter = GreenColorPaletteDark.black.withOpacity(0.4);

  AppColorScheme.purpleLight()
      : primary = PurpleColorPaletteLight.ultramarineBlue,
        scaffoldBackground = PurpleColorPaletteLight.white,
        schemeButtonBg = PurpleColorPaletteLight.ghostWhite,
        onBackground = PurpleColorPaletteLight.white,
        bottomSheetBackground = PurpleColorPaletteLight.white,
        elevatedButtonBackgroundColor = PurpleColorPaletteLight.ultramarineBlue,
        elevatedButtonForegroundColor = PurpleColorPaletteLight.white,
        outlinedButtonBackgroundColor = PurpleColorPaletteLight.coralRed,
        outlinedButtonForegroundColor = PurpleColorPaletteLight.coralRed,
        schemeSecondPreviewColor = PurpleColorPaletteLight.ceruleanFrost,
        schemeThirdPreviewColor = PurpleColorPaletteLight.white,
        schemeFourthPreviewColor = PurpleColorPaletteLight.sonicSilver,
        barrierColor = PurpleColorPaletteLight.yankeesBlue.withOpacity(0.6),
        photoFilter = PurpleColorPaletteLight.spaceCadet.withOpacity(0.4);

  AppColorScheme.purpleDark()
      : primary = PurpleColorPaletteDark.ultramarineBlue,
        scaffoldBackground = PurpleColorPaletteDark.yankeesBlue,
        onBackground = PurpleColorPaletteDark.charcoal,
        schemeButtonBg = PurpleColorPaletteDark.independence,
        bottomSheetBackground = PurpleColorPaletteDark.charcoal,
        elevatedButtonBackgroundColor = PurpleColorPaletteDark.ultramarineBlue,
        elevatedButtonForegroundColor = PurpleColorPaletteDark.white,
        outlinedButtonBackgroundColor = PurpleColorPaletteDark.coralRed,
        outlinedButtonForegroundColor = PurpleColorPaletteDark.coralRed,
        schemeSecondPreviewColor = PurpleColorPaletteDark.ceruleanFrost,
        schemeThirdPreviewColor = PurpleColorPaletteDark.white,
        schemeFourthPreviewColor = PurpleColorPaletteDark.sonicSilver,
        barrierColor = PurpleColorPaletteDark.yankeesBlue.withOpacity(0.6),
        photoFilter = PurpleColorPaletteDark.spaceCadet.withOpacity(0.4);

  AppColorScheme.orangeLight()
      : primary = OrangeColorPaletteLight.heatWave,
        scaffoldBackground = OrangeColorPaletteLight.floralWhite,
        schemeButtonBg = OrangeColorPaletteLight.cultured,
        onBackground = OrangeColorPaletteLight.white,
        bottomSheetBackground = OrangeColorPaletteLight.white,
        elevatedButtonBackgroundColor = OrangeColorPaletteLight.heatWave,
        elevatedButtonForegroundColor = OrangeColorPaletteLight.white,
        outlinedButtonBackgroundColor = OrangeColorPaletteLight.coralRed,
        outlinedButtonForegroundColor = OrangeColorPaletteLight.coralRed,
        schemeSecondPreviewColor = OrangeColorPaletteLight.paleTaupe,
        schemeThirdPreviewColor = OrangeColorPaletteLight.white,
        schemeFourthPreviewColor = OrangeColorPaletteLight.sonicSilver,
        barrierColor = OrangeColorPaletteLight.blackCoffee.withOpacity(0.6),
        photoFilter = OrangeColorPaletteLight.blackCoffee.withOpacity(0.4);

  AppColorScheme.orangeDark()
      : primary = OrangeColorPaletteDark.heatWave,
        scaffoldBackground = OrangeColorPaletteDark.raisinBlack,
        schemeButtonBg = OrangeColorPaletteDark.darkPuce,
        onBackground = OrangeColorPaletteDark.blackCoffee,
        bottomSheetBackground = OrangeColorPaletteDark.darkJungleGreen,
        elevatedButtonBackgroundColor = OrangeColorPaletteDark.heatWave,
        elevatedButtonForegroundColor = OrangeColorPaletteDark.white,
        outlinedButtonBackgroundColor = OrangeColorPaletteDark.coralRed,
        outlinedButtonForegroundColor = OrangeColorPaletteDark.coralRed,
        schemeSecondPreviewColor = OrangeColorPaletteDark.paleTaupe,
        schemeThirdPreviewColor = OrangeColorPaletteDark.white,
        schemeFourthPreviewColor = OrangeColorPaletteDark.sonicSilver,
        barrierColor = OrangeColorPaletteDark.eerieBlack.withOpacity(0.8),
        photoFilter = OrangeColorPaletteDark.blackCoffee.withOpacity(0.4);

  const AppColorScheme._({
    required this.primary,
    required this.scaffoldBackground,
    required this.onBackground,
    required this.schemeButtonBg,
    required this.bottomSheetBackground,
    required this.elevatedButtonBackgroundColor,
    required this.elevatedButtonForegroundColor,
    required this.outlinedButtonBackgroundColor,
    required this.outlinedButtonForegroundColor,
    required this.barrierColor,
    required this.photoFilter,
    required this.schemeSecondPreviewColor,
    required this.schemeThirdPreviewColor,
    required this.schemeFourthPreviewColor,
  });

  @override
  ThemeExtension<AppColorScheme> copyWith({
    Color? primary,
    Color? scaffoldBackground,
    Color? schemeButtonBg,
    Color? onBackground,
    Color? bottomSheetBackground,
    Color? elevatedButtonBackgroundColor,
    Color? elevatedButtonForegroundColor,
    Color? outlinedButtonBackgroundColor,
    Color? outlinedButtonForegroundColor,
    Color? barrierColor,
    Color? photoFilter,
    Color? labelColor,
    Color? schemeSecondPreviewColor,
    Color? schemeThirdPreviewColor,
    Color? schemeFourthPreviewColor,
  }) {
    return AppColorScheme._(
      primary: primary ?? this.primary,
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
      onBackground: onBackground ?? this.onBackground,
      schemeButtonBg: schemeButtonBg ?? this.schemeButtonBg,
      schemeSecondPreviewColor:
          schemeSecondPreviewColor ?? this.schemeSecondPreviewColor,
      schemeThirdPreviewColor:
          schemeThirdPreviewColor ?? this.schemeThirdPreviewColor,
      schemeFourthPreviewColor:
          schemeFourthPreviewColor ?? this.schemeFourthPreviewColor,
      bottomSheetBackground:
          bottomSheetBackground ?? this.bottomSheetBackground,
      elevatedButtonBackgroundColor:
          elevatedButtonBackgroundColor ?? this.elevatedButtonBackgroundColor,
      elevatedButtonForegroundColor:
          elevatedButtonForegroundColor ?? this.elevatedButtonForegroundColor,
      outlinedButtonBackgroundColor:
          outlinedButtonBackgroundColor ?? this.outlinedButtonBackgroundColor,
      outlinedButtonForegroundColor:
          outlinedButtonForegroundColor ?? this.outlinedButtonForegroundColor,
      barrierColor: barrierColor ?? this.barrierColor,
      photoFilter: photoFilter ?? this.photoFilter,
    );
  }

  @override
  ThemeExtension<AppColorScheme> lerp(
    ThemeExtension<AppColorScheme>? other,
    double t,
  ) {
    if (other is! AppColorScheme) {
      return this;
    }

    return AppColorScheme._(
      primary: Color.lerp(primary, other.primary, t)!,
      scaffoldBackground:
          Color.lerp(scaffoldBackground, other.scaffoldBackground, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      schemeSecondPreviewColor: Color.lerp(
          schemeSecondPreviewColor, other.schemeSecondPreviewColor, t)!,
      schemeThirdPreviewColor: Color.lerp(
          schemeThirdPreviewColor, other.schemeThirdPreviewColor, t)!,
      schemeFourthPreviewColor: Color.lerp(
          schemeFourthPreviewColor, other.schemeFourthPreviewColor, t)!,
      schemeButtonBg: Color.lerp(schemeButtonBg, other.schemeButtonBg, t)!,
      bottomSheetBackground:
          Color.lerp(bottomSheetBackground, other.bottomSheetBackground, t)!,
      elevatedButtonBackgroundColor: Color.lerp(elevatedButtonBackgroundColor,
          other.elevatedButtonBackgroundColor, t)!,
      elevatedButtonForegroundColor: Color.lerp(elevatedButtonForegroundColor,
          other.elevatedButtonForegroundColor, t)!,
      outlinedButtonBackgroundColor: Color.lerp(outlinedButtonBackgroundColor,
          other.outlinedButtonBackgroundColor, t)!,
      outlinedButtonForegroundColor: Color.lerp(outlinedButtonForegroundColor,
          other.outlinedButtonForegroundColor, t)!,
      barrierColor: Color.lerp(barrierColor, other.barrierColor, t)!,
      photoFilter: Color.lerp(photoFilter, other.photoFilter, t)!,
    );
  }

  /// Returns [AppColorScheme] from [context].
  static AppColorScheme of(BuildContext context) =>
      Theme.of(context).extension<AppColorScheme>()!;
}