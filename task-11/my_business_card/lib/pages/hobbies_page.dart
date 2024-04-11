import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

abstract class AppColors{
  static const backgroundMain = Colors.white70;
  static const backgroundNavbar = Colors.white70;
}

abstract class AppTexts{
  static const hobby = 'Люблю активные мероприятия на воздухе: кататься на велосипеде? - ДА!, поехать на рыбалку? - тоже ДА! Изучить новый язык? - 为什么不呢？ ';
}

class HobbiesPage extends StatelessWidget {
  const HobbiesPage({super.key});

  @override
  Widget build ( BuildContext context)=> Scaffold(
    backgroundColor: AppColors.backgroundMain,
    appBar: AppBar(title: const Text( "Мои хобби",
     style: TextStyle(color: Colors.black, fontSize: 24),),
   centerTitle: true,
  ),
   body: Center(
    child: Column(
      mainAxisAlignment:MainAxisAlignment.center,
      children: [
        FlipCard(
  fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
  direction: FlipDirection.HORIZONTAL, // default
  side: CardSide.FRONT, 
  front: Padding(
    padding: const EdgeInsets.symmetric(
    horizontal: 10,
    vertical: 20,
  ),
   child: Container( 
    alignment: Alignment.center,
    width: 300,
    height: 500,
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/viajero.JPG'),
        fit: BoxFit.cover), 
  )
  )
  ),

  back: Padding(
    padding: const EdgeInsets.symmetric(
    horizontal: 10,
    vertical: 20,
  ),
   child: Container(
    alignment: Alignment.center,
    width: 300,
    height: 500,
    decoration: const BoxDecoration(
      gradient:  LinearGradient(
        colors: [Colors.orange,
                  Colors.purple,])
                  ),
    child: const Padding( padding: EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 20,
  ),child: Text(AppTexts.hobby, softWrap: true, textAlign: TextAlign.center,style: TextStyle(fontSize: 18, color: Colors.black,fontWeight: FontWeight.bold),
    ),
    ))
    ),
    )
]
)
  )
  );
}