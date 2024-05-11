import 'package:flutter/material.dart';
import 'package:shestyorochka_app/assets/texts_strings.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(AppTexts.emptyScreen),
    );
  }
}
