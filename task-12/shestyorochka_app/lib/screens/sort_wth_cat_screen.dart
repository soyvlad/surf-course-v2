import 'package:flutter/material.dart';
import 'package:shestyorochka_app/domain/entity/product_entity.dart';
import 'package:shestyorochka_app/screens/card_screen.dart';

class SortWithoutCategoryScreen extends StatelessWidget {
  // Конструктор SortWithoutCategoryScreen принимает обязательный параметр products типа List<ProductEntity>
  // и необязательный параметр key типа Key.
  const SortWithoutCategoryScreen({required this.products, super.key});
  // Поле products объявляется как final и хранит список продуктов типа ProductEntity.
  final List<ProductEntity> products;
  // Метод build переопределяется для построения виджета.
  @override
  Widget build(BuildContext context) {
    // Возвращаемым виджетом является Expanded, который содержит ListView.builder.
    return Expanded(
      // ListView.builder строит список с элементами, количество которых равно длине списка products.
      child: ListView.builder(
        itemCount: products.length,
        // Каждый элемент списка создается с помощью CardScreen,
        // передавая в него соответствующий продукт из списка products.
        itemBuilder: (context, index) => CardScreen(product: products[index]),
      ),
    );
  }
}
