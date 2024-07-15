import 'package:flutter/material.dart';
import 'package:theme_changer/assets/app_scheme_colors.dart';
import 'package:theme_changer/assets/app_txt_scheme.dart';

class InfoFieldItem extends StatelessWidget {
  const InfoFieldItem({
    super.key,
    this.hasArrow = false,
    this.onTap,
    required this.text,
    required this.label,
  });

  final bool hasArrow;
  final String label;
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
            color: AppColorScheme.of(context).onBackground,
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppTextScheme.of(context).regular14Label,
                ),
                Text(
                  text,
                  style: AppTextScheme.of(context).regular14,
                ),
              ],
            ),
            hasArrow ? const Icon(Icons.chevron_right) : Container(),
          ],
        ),
      ),
    );
  }
}
