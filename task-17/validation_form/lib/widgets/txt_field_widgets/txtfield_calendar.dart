import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:validation_form/assets/app_colors.dart';
import 'package:validation_form/assets/app_strings.dart';
import 'package:validation_form/assets/app_txt_style.dart';

// Date picker
class TextFieldBirthday extends StatefulWidget {
  final bool sendForm;
  final Function(String) updateDateBirthday;
  final Function checkIfAllFieldsAreFilled;
  final String title;

  const TextFieldBirthday({
    super.key,
    required this.sendForm,
    required this.updateDateBirthday,
    required this.checkIfAllFieldsAreFilled,
    required this.title,
  });

  @override
  State<TextFieldBirthday> createState() => _TextFieldBirthdayState();
}

class _TextFieldBirthdayState extends State<TextFieldBirthday> {
  DateTime? selectedDate;

  _selectDate(BuildContext context) async {
    final ThemeData theme = Theme.of(context);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return buildMaterialDatePicker(context);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return buildCupertinoDatePicker(context);
    }
  }

  Future<DateTime?> buildMaterialDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
      helpText: widget.title,
      cancelText: AppStrings.cancel,
      confirmText: AppStrings.choose,
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        widget
            .updateDateBirthday(DateFormat('dd.MM.yyyy').format(selectedDate!));
      });
      widget.checkIfAllFieldsAreFilled();
    }
    return null;
  }

  buildCupertinoDatePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (picked) {
                if (picked != selectedDate) {
                  setState(() {
                    selectedDate = picked;
                    widget.updateDateBirthday(
                        DateFormat('dd.MM.yyyy').format(selectedDate!));
                  });
                  widget.checkIfAllFieldsAreFilled();
                }
              },
              initialDateTime: DateTime.now(),
              minimumDate: DateTime(1990),
              maximumDate: DateTime.now(),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = widget.title;
    if (selectedDate != null) {
      formattedDate = DateFormat('dd.MM.yyyy').format(selectedDate!);
    }

    return GestureDetector(
      onTap: () async {
        if (!widget.sendForm) {
          _selectDate(context);
        }
      },
      child: Container(
        width: double.infinity,
        padding: formattedDate == widget.title
            ? const EdgeInsets.all(16)
            : const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            formattedDate == widget.title
                ? const SizedBox()
                : Column(
                    children: [
                      Text(
                        widget.title,
                        style: AppTextStyles.text12
                            .copyWith(color: AppColors.cadetBlueCrayola),
                      ),
                      const SizedBox(height: 2),
                    ],
                  ),
            Text(
              formattedDate,
              style: AppTextStyles.text16_1.copyWith(
                  color: formattedDate == widget.title
                      ? AppColors.cadetBlueCrayola
                      : AppColors.slateGrey),
            ),
          ],
        ),
      ),
    );
  }
}
