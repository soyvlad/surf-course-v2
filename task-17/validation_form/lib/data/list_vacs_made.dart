import 'package:flutter/cupertino.dart';
import 'package:validation_form/assets/app_icons.dart';
import 'package:validation_form/assets/app_strings.dart';
import 'package:validation_form/assets/app_txt_style.dart';
import 'package:validation_form/widgets/buttons/checkbox_vac_btn.dart';

// Made vacs list
class MadeVaccinations extends StatelessWidget {
  final bool sendForm;
  final Function checkIfAllFieldsAreFilled;

  final bool isCheckedRabies;
  final Function(bool) updateCheckedRabies;
  final String controllerRabies;
  final Function(String) updateDateRabies;

  final bool isCheckedCovid;
  final Function(bool) updateCheckedCovid;
  final String controllerCovid;
  final Function(String) updateDateCovid;

  final bool isCheckedMalaria;
  final Function(bool) updateCheckedMalaria;
  final String controllerMalaria;
  final Function(String) updateDateMalaria;

  const MadeVaccinations({
    super.key,
    required this.isCheckedRabies,
    required this.updateCheckedRabies,
    required this.controllerRabies,
    required this.updateDateRabies,
    required this.sendForm,
    required this.checkIfAllFieldsAreFilled,
    required this.isCheckedCovid,
    required this.updateCheckedCovid,
    required this.controllerCovid,
    required this.updateDateCovid,
    required this.isCheckedMalaria,
    required this.updateCheckedMalaria,
    required this.controllerMalaria,
    required this.updateDateMalaria,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(
          AppStrings.vaccinationsAgainst,
          style: AppTextStyles.text24,
        ),
        const SizedBox(height: 16),
        CheckboxVaccinations(
          check: isCheckedRabies,
          updateChecked: updateCheckedRabies,
          iconPath: AppIcons.check,
          title: AppStrings.rabies,
          controller: controllerRabies,
          updateDate: updateDateRabies,
          sendForm: sendForm,
          checkIfAllFieldsAreFilled: checkIfAllFieldsAreFilled,
        ),
        CheckboxVaccinations(
          check: isCheckedCovid,
          updateChecked: updateCheckedCovid,
          iconPath: AppIcons.check,
          title: AppStrings.covid,
          controller: controllerCovid,
          updateDate: updateDateCovid,
          sendForm: sendForm,
          checkIfAllFieldsAreFilled: checkIfAllFieldsAreFilled,
        ),
        CheckboxVaccinations(
          check: isCheckedMalaria,
          updateChecked: updateCheckedMalaria,
          iconPath: AppIcons.check,
          title: AppStrings.malaria,
          controller: controllerMalaria,
          updateDate: updateDateMalaria,
          sendForm: sendForm,
          checkIfAllFieldsAreFilled: checkIfAllFieldsAreFilled,
        ),
      ],
    );
  }
}
