import 'package:shestyorochka_app/domain/entity/amount.dart';
import 'package:decimal/decimal.dart';
import 'category_type.dart';

// Содержит в себе название, цену, категорию и ссылку на изображение.
class ProductEntity {
  // Название товара
  final String title;

  // Цена товара в копейках. Без скидки.
  final int price;

  // Категория товара.
  final CategoryType category;

  // Ссылка на изображение товара.
  final String imageUrl;

  // Количество товаров. Может быть описанно в граммах или в штуках.
  final Amount amount;

  // Скидка на товар.
  final double discount;

  Decimal get decimalPrice => _getDecimalPrice(price);

  ProductEntity({
    required this.title,
    required this.price,
    required this.category,
    required this.imageUrl,
    required this.amount,
    this.discount = 0,
  });

  // Переводим цену в формат Decimal для точных расчётов.

  Decimal _getDecimalPrice(int price) {
    final priceString = (price / 100).toStringAsFixed(2);
    return Decimal.parse(priceString);
  }
}
