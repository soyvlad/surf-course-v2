import 'package:flutter/material.dart';
import 'package:validation_form/assets/app_colors.dart';
import 'package:validation_form/assets/app_strings.dart';
import 'package:validation_form/assets/app_txt_style.dart';

// E-mail form
class TextFieldEmail extends StatefulWidget {
  final GlobalKey<FormState> keyForm;
  final TextEditingController controller;
  final bool sendForm;
  final Function checkIfAllFieldsAreFilled;
  final Function(bool) updateEmailCheck;

  const TextFieldEmail({
    super.key,
    required this.keyForm,
    required this.controller,
    required this.sendForm,
    required this.checkIfAllFieldsAreFilled,
    required this.updateEmailCheck,
  });

  @override
  State<TextFieldEmail> createState() => _TextFieldEmailState();
}

class _TextFieldEmailState extends State<TextFieldEmail> {
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
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          fillColor: AppColors.white,
          filled: true,
          labelText: AppStrings.theOwnersMail,
          labelStyle: AppTextStyles.text16_2
              .copyWith(color: AppColors.cadetBlueCrayola),
          hintText: AppStrings.theOwnersMail,
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
        validator: (value) {
          widget.updateEmailCheck(false);
          widget.checkIfAllFieldsAreFilled();
          if (value == null || value.isEmpty) {
            return AppStrings.enterEmail;
          }
          // A regular expression for checking email
          String pattern =
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
          RegExp regex = RegExp(pattern);

          if (!regex.hasMatch(value)) {
            return AppStrings.enterInvalidEmail;
          }
          widget.updateEmailCheck(true);
          widget.checkIfAllFieldsAreFilled();
          return null;
        },
      ),
    );
  }
}
