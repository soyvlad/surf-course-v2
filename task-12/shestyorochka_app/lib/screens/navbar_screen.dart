// Экран с таблицами.

import 'package:flutter/material.dart';
import 'package:shestyorochka_app/assets/colors.dart';
import 'package:shestyorochka_app/assets/text_styles.dart';
import 'package:shestyorochka_app/assets/texts_strings.dart';
import 'package:shestyorochka_app/screens/empty_screen.dart';
import 'package:shestyorochka_app/screens/home_screen.dart';

// Объявление класса NavBarScreen, который является виджетом состояния (StatefulWidget).
class NavBarScreen extends StatefulWidget {
  // Конструктор класса NavBarScreen без именованных параметров, который вызывает конструктор родительского класса.
  const NavBarScreen({super.key});
  // Переопределение метода createState() для создания экземпляра класса _NavBarScreenState, который управляет состоянием виджета.
  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

// Объявление класса _NavBarScreenState, который расширяет State и управляет состоянием виджета NavBarScreen.
class _NavBarScreenState extends State<NavBarScreen> {
  // Объявление переменной _currentIndex, которая хранит индекс текущей страницы внизу экрана.
  int _currentIndex = 3;
  // Объявление списка _pages, который содержит виджеты для отображения на разных страницах навигационного бара.
  final List<Widget> _pages = const [
    EmptyScreen(),
    EmptyScreen(),
    EmptyScreen(),
    HomeScreen(),
  ];
  // Переопределение метода build для построения виджета.
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        // Установка текущего индекса и обработчика события onTap
        // для переключения страниц при нажатии на пункт навигационной панели.
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_rounded), label: AppTexts.catalogue),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), label: AppTexts.search),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined), label: AppTexts.basket),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined), label: AppTexts.personal),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.white,
        selectedItemColor: theme.primaryColor,
        selectedLabelStyle: AppTextStyles.navBar,
      ),
    );
  }
}
