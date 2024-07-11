import 'package:flutter/material.dart';
import 'package:magic_ball/assets/app_theme_data.dart';
import 'package:magic_ball/presentation/screens/home_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightTheme,
      home: const HomeScreen(),
    );
  }
}
