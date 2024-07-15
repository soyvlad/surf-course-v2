import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:validation_form/assets/app_colors.dart';
import 'package:validation_form/assets/app_txt_style.dart';
import 'package:validation_form/data/enum_animals.dart';

// Animal option button
class ButtonAnimal extends StatelessWidget {
  final String title;
  final String iconPath;
  final Animal currentAnimal;
  final Animal animal;
  final bool sendForm;
  final Function(Animal) updateButtonAnimal;

  const ButtonAnimal({
    super.key,
    required this.title,
    required this.iconPath,
    required this.currentAnimal,
    required this.animal,
    required this.updateButtonAnimal,
    required this.sendForm,
  });

  @override
  Widget build(BuildContext context) {
    final check = animal == currentAnimal;

    return GestureDetector(
      onTap: () {
        if (!sendForm) updateButtonAnimal(animal);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: check ? AppColors.ardentPink : AppColors.white,
              shape: BoxShape.rectangle,
            ),
            child: SvgPicture.asset(
              iconPath,
              colorFilter: ColorFilter.mode(
                  check ? AppColors.white : AppColors.slateGrey,
                  BlendMode.srcIn),
              height: 32,
              width: 32,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: AppTextStyles.text12.copyWith(color: AppColors.slateGrey),
          )
        ],
      ),
    );
  }
}
