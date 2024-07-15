import 'package:validation_form/assets/app_strings.dart';

enum Animal {
  dog(AppStrings.dog),
  cat(AppStrings.cat),
  parrot(AppStrings.parrot),
  hamster(AppStrings.hamster);

  const Animal(this.name);
  final String name;

  @override
  String toString() => name;
}
