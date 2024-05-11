import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:my_business_card/assets/app_colors.dart';
import 'package:my_business_card/assets/app_texts.dart';
import 'package:my_business_card/assets/pics.dart';
import 'package:my_business_card/assets/text_styles.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: AppColors.backgroundMain,
      appBar: AppBar(
        title: const Text('Мой профиль', style: AppTextStyles.appBar),
        centerTitle: true,
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        FlipCard(
          fill: Fill
              .fillBack, // Fill the back side of the card to make in the same size as the front.
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
                        image: AssetImage(AppPics.image1), fit: BoxFit.cover),
                  ))),

          back: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              child: Container(
                  alignment: Alignment.center,
                  width: 300,
                  height: 500,
                  decoration: AppBackCard.backCard,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Text(AppTexts.profile,
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.backCardText),
                  ))),
        )
      ])));
}
