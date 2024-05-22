//RGB

import 'package:palitra_app/assets/color_strings.dart';

enum RgbType {
  red(AppColors.redColor),
  green(AppColors.greenColor),
  blue(AppColors.blueColor);

  final String name;
  const RgbType(this.name);
}
