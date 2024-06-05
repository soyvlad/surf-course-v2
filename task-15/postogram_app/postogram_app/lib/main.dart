import 'package:flutter/material.dart';
import 'package:postogram_app/data/repository/photos_repository.dart';
import 'package:postogram_app/presentation/photos_screen.dart';

void main() {
  runApp(const MyApp());
}

final photosRepository = PhotosRepository();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Postogram App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PhotosScreen(),
    );
  }
}
