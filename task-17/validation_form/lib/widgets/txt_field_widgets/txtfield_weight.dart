import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validation_form/assets/app_colors.dart';
import 'package:validation_form/assets/app_strings.dart';
import 'package:validation_form/assets/app_txt_style.dart';

// Weight form
class TextFieldWeight extends StatefulWidget {
  final GlobalKey<FormState> keyForm;
  final TextEditingController controller;
  final bool sendForm;
  final Function checkIfAllFieldsAreFilled;

  const TextFieldWeight({
    super.key,
    required this.keyForm,
    required this.controller,
    required this.sendForm,
    required this.checkIfAllFieldsAreFilled,
  });

  @override
  State<TextFieldWeight> createState() => _TextFieldWeightState();
}

class _TextFieldWeightState extends State<TextFieldWeight> {
  late FocusNode _focusNode;
  bool _error = true;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      // If the field loses focus, we call form validation
      if (!_focusNode.hasFocus) {
        setState(() {
          _error = widget.keyForm.currentState?.validate() ?? true;
        });
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Form(
      key: widget.keyForm,
      child: TextFormField(
        focusNode: _focusNode,
        controller: widget.controller,
        cursorColor: theme.primaryColor,
        style: _error
            ? AppTextStyles.text16_1.copyWith(color: AppColors.slateGrey)
            : AppTextStyles.text16_1
                .copyWith(color: AppColors.redOrangeCrayola),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          fillColor: AppColors.white,
          filled: true,
          labelText: AppStrings.weightKg,
          labelStyle: AppTextStyles.text16_2
              .copyWith(color: AppColors.cadetBlueCrayola),
          hintText: AppStrings.weightKg,
          hintStyle: AppTextStyles.text16_1
              .copyWith(color: AppColors.cadetBlueCrayola),
          floatingLabelStyle:
              AppTextStyles.text12.copyWith(color: AppColors.cadetBlueCrayola),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          errorStyle:
              AppTextStyles.text12.copyWith(color: AppColors.redOrangeCrayola),
        ),
        enabled: !widget.sendForm,
        inputFormatters: [
          LengthLimitingTextInputFormatter(2),
        ],
        validator: (value) {
          widget.checkIfAllFieldsAreFilled();
          if (value == null || value.isEmpty) {
            return AppStrings.enterWeightKg;
          }
          // An attempt to convert a string to a number.
          final number = int.tryParse(value);

          // Checking that the value is a number and is greater than or equal to 0.
          if (number == null || number < 0) {
            return AppStrings.fillInWeight;
          }
          return null;
        },
      ),
    );
  }
}
