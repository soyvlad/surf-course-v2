import 'package:flutter/material.dart';
import 'package:shestyorochka_app/domain/entity/product_entity.dart';
import 'package:shestyorochka_app/screens/product_card_screen.dart';
import 'package:shestyorochka_app/utils/amount_x.dart';

// Объявление класса CardScreen, наследующего StatelessWidget.
class CardScreen extends StatelessWidget {
  // Конструктор класса CardScreen, который принимает
  // обязательный параметр product и необязательный параметр key.
  const CardScreen({
    required this.product,
    super.key,
  });

  // Объявление переменной product типа ProductEntity,
  // которая будет хранить информацию о продукте.
  final ProductEntity product;

  // Переопределен метод build, который возвращает
  // виджет ProductCardScreen, отображающий информацию о продукте.
  @override
  Widget build(BuildContext context) {
    // Передача аргументов imageURL, title, quantityText, priceText и discount
    // в виджет ProductCardScreen на основе данных о продукте, хранящихся в переменной product.
    return ProductCardScreen(
      imageURL: product.imageUrl,
      title: product.title,
      quantityText: product.amount.getQuantityText(),
      priceText: product.price / 100,
      discount: product.discount,
    );
  }
}
