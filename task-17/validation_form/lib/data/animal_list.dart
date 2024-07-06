import 'package:flutter/material.dart';
import 'package:validation_form/assets/app_icons.dart';
import 'package:validation_form/assets/app_strings.dart';
import 'package:validation_form/data/enum_animals.dart';
import 'package:validation_form/widgets/buttons/animals_btn.dart';

// Animal option list
class ListAnimal extends StatelessWidget {
  final ValueNotifier<Animal> controllerButtonAnimal;
  final Function(Animal) updateButtonAnimal;
  final bool sendForm;

  const ListAnimal({
    super.key,
    required this.controllerButtonAnimal,
    required this.updateButtonAnimal,
    required this.sendForm,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controllerButtonAnimal,
      builder: (context, value, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonAnimal(
              title: AppStrings.dog,
              iconPath: AppIcons.dog,
              currentAnimal: value,
              animal: Animal.dog,
              updateButtonAnimal: updateButtonAnimal,
              sendForm: sendForm,
            ),
            ButtonAnimal(
              title: AppStrings.cat,
              iconPath: AppIcons.cat,
              currentAnimal: value,
              animal: Animal.cat,
              updateButtonAnimal: updateButtonAnimal,
              sendForm: sendForm,
            ),
            ButtonAnimal(
              title: AppStrings.parrot,
              iconPath: AppIcons.parrot,
              currentAnimal: value,
              animal: Animal.parrot,
              updateButtonAnimal: updateButtonAnimal,
              sendForm: sendForm,
            ),
            ButtonAnimal(
              title: AppStrings.hamster,
              iconPath: AppIcons.hamster,
              currentAnimal: value,
              animal: Animal.hamster,
              updateButtonAnimal: updateButtonAnimal,
              sendForm: sendForm,
            ),
          ],
        );
      },
    );
  }
}
