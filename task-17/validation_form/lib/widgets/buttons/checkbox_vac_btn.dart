import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:validation_form/assets/app_colors.dart';
import 'package:validation_form/assets/app_strings.dart';
import 'package:validation_form/assets/app_txt_style.dart';
import 'package:validation_form/widgets/txt_field_widgets/txtfield_calendar.dart';

// Made Vacuna button
class CheckboxVaccinations extends StatelessWidget {
  final bool check;
  final Function(bool) updateChecked;
  final String iconPath;
  final String title;
  final String controller;
  final Function(String) updateDate;
  final bool sendForm;
  final Function checkIfAllFieldsAreFilled;

  const CheckboxVaccinations({
    super.key,
    required this.check,
    required this.iconPath,
    required this.updateChecked,
    required this.title,
    required this.controller,
    required this.updateDate,
    required this.sendForm,
    required this.checkIfAllFieldsAreFilled,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (!sendForm) {
              updateChecked(!check);
            }
          },
          child: Container(
            width: double.infinity,
            color: Colors.white.withOpacity(0.001),
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: check ? AppColors.ardentPink : AppColors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: SvgPicture.asset(
                    iconPath,
                    colorFilter: const ColorFilter.mode(
                        AppColors.white, BlendMode.srcIn),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: AppTextStyles.text16_2,
                ),
              ],
            ),
          ),
        ),
        check
            ? Column(
                children: [
                  const SizedBox(height: 16),
                  TextFieldBirthday(
                    updateDateBirthday: updateDate,
                    checkIfAllFieldsAreFilled: checkIfAllFieldsAreFilled,
                    sendForm: sendForm,
                    title: AppStrings.dateLastVaccination,
                  ),
                  const SizedBox(height: 16),
                ],
              )
            : const SizedBox(),
      ],
    );
  }
}
