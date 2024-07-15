import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validation_form/assets/app_colors.dart';
import 'package:validation_form/assets/app_strings.dart';
import 'package:validation_form/assets/app_txt_style.dart';

// Name form
class TextFieldName extends StatefulWidget {
  final GlobalKey<FormState> keyForm;
  final TextEditingController controller;
  final bool sendForm;
  final Function checkIfAllFieldsAreFilled;

  const TextFieldName({
    super.key,
    required this.keyForm,
    required this.controller,
    required this.sendForm,
    required this.checkIfAllFieldsAreFilled,
  });

  @override
  State<TextFieldName> createState() => _TextFieldNameState();
}

class _TextFieldNameState extends State<TextFieldName> {
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
        decoration: InputDecoration(
          fillColor: AppColors.white,
          filled: true,
          labelText: AppStrings.petsName,
          labelStyle: AppTextStyles.text16_2
              .copyWith(color: AppColors.cadetBlueCrayola),
          hintText: AppStrings.petsName,
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
          LengthLimitingTextInputFormatter(20),
        ],
        validator: (value) {
          widget.checkIfAllFieldsAreFilled();
          if (value == null || value.trim().isEmpty) {
            return AppStrings.enterPetsName;
          }

          if (value.trim().length < 3) {
            return AppStrings.restrictionSymbols;
          }
          return null;
        },
      ),
    );
  }
}
