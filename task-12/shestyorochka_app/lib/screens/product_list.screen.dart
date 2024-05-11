import 'package:flutter/material.dart';

import 'package:shestyorochka_app/screens/navbar_screen.dart';

class ProductListScreen extends StatelessWidget {
  // В данном случае используется конструктор const ProductListScreen,
  // который не принимает никаких аргументов.

  // В рамках конструктора вызывается конструктор родительского класса
  // StatelessWidget и передается аргумент key.
  const ProductListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // В виджете Scaffold устанавливается нижняя навигационная панель
      // с помощью виджета NavBarScreen.
      bottomNavigationBar: NavBarScreen(),
    );
  }
}
