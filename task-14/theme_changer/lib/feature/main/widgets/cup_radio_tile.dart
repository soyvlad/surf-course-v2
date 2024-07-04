import 'package:flutter/cupertino.dart';
import 'package:theme_changer/assets/app_scheme_colors.dart';
import 'package:theme_changer/assets/app_txt_scheme.dart';

class CupertinoRadioTile<T> extends StatelessWidget {
  const CupertinoRadioTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.label,
    required this.onChanged,
  });

  final String label;
  final T value;
  final T groupValue;
  final Function(T? value) onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: CupertinoRadio<T>(
                activeColor: AppColorScheme.of(context).primary,
                value: value,
                groupValue: groupValue,
                onChanged: onChanged,
              ),
            ),
            Text(
              label,
              style: AppTextScheme.of(context).regular16,
            ),
          ],
        ),
      ),
    );
  }
}
