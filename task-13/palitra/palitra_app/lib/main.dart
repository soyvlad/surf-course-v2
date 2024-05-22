import 'package:flutter/material.dart';
import 'package:palitra_app/api/service/colors_api_assets.dart';
import 'package:palitra_app/data/mapper/color_mapper.dart';
import 'package:palitra_app/data/repository/colors_repository.dart';
import 'package:palitra_app/main_screen.dart';

void main() {
  runApp(const MyApp());
}

final colorsRepository = ColorsRepository(
  colorsApi: ColorsApiAssets(),
  colorsMapper: ColorMapper(),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Палитра цветов',
     /* theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),*/
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
