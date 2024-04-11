import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'pages/main_page.dart';
import 'pages/hobbies_page.dart';
import 'pages/workexp_page.dart';
//import 'package:flip_card/flip_card.dart';

abstract class AppColors{
  static const backgroundMain = Colors.white70;
  static const backgroundNavbar = Colors.white70;
}

void main () {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
Widget build (BuildContext context){

  return const MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  );
 } 
}
class HomePage extends StatefulWidget {
  const HomePage ({super.key});

@override
State<HomePage> createState ()=> _HomePageState();
}
class _HomePageState extends State<HomePage>{
  int index =1;

  final screens = [
    const HobbiesPage(),
    const MainPage(),
    const WorkExpPage(),
  ];

  @override
  Widget build (BuildContext context){
    final items = <Widget>[
    const Icon(Icons.travel_explore,size:30),
    const Icon (Icons.home, size:30),
    const Icon (Icons.work,size:30),
    ];
 return Scaffold(
  backgroundColor: AppColors.backgroundMain,
  body: screens [index], 
  bottomNavigationBar: CurvedNavigationBar (
   items: items,
   index: index,
   backgroundColor: AppColors.backgroundNavbar,
   onTap: (index)=> setState(() {
     this.index =index;
   }),
   ),
 );
  }
}


