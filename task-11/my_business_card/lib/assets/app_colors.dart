import 'package:flutter/material.dart';

abstract class AppColors {
  static const backgroundMain = Colors.white70;
  static const backgroundNavbar = Colors.white70;
}

class AppBackCard {
  static const BoxDecoration backCard = BoxDecoration(
      gradient: LinearGradient(colors: [
    Colors.orange,
    Colors.purple,
  ]));
}
