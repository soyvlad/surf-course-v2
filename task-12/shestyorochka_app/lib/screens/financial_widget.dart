import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shestyorochka_app/assets/texts_strings.dart';
import 'package:shestyorochka_app/domain/entity/product_entity.dart';
import 'package:shestyorochka_app/utils/decimal_currency.dart';

// Объявление класса FinancialWidget, который является наследником класса StatelessWidget.
class FinancialWidget extends StatelessWidget {
  // Объявление переменной products типа List<ProductEntity> в классе FinancialWidget.
  final List<ProductEntity> products;
  // Конструктор класса FinancialWidget, который принимает параметр products.
  const FinancialWidget({super.key, required this.products});
  // Переопределение метода build для отображения данных в виджете.
  @override
  Widget build(BuildContext context) {
    // Вычисление общей суммы покупки (fullTotal) с помощью метода _getFullTotal.
    final fullTotal = _getFullTotall(products);
    // Вычисление суммы скидки (discount) с помощью метода _getDiscount.
    final discount = _getDiscount(products);
    // Вычисление итоговой суммы после скидки.
    final total = fullTotal - discount;
    // Возвращение виджета Column с дочерними виджетами: текстовое сообщение,
    // данные о покупках и итоговая сумма.
    return Column(
      children: [
        const Text(AppTexts.inYourPurchase),
        _RowWidget(
            description: _plural(products.length),
            value: fullTotal.toFormattedCurrency()),
        _RowWidget(
            description: AppTexts.discount,
            value: discount.toFormattedCurrency()),
        _RowWidget(
            description: AppTexts.total, value: total.toFormattedCurrency()),
      ],
    );
  }

  // Склонение слова 'товар'.
  String _plural(int count) {
    return Intl.plural(
      count,
      zero: AppTexts.noProducts,
      one: AppTexts.oneProduct(count),
      few: AppTexts.fewProducts(count),
      many: AppTexts.manyProducts(count),
      other: AppTexts.otherProducts(count),
      locale: 'ru',
    );
  }

  // Метод _getFullTotal для вычисления cтоимости товара.
  Decimal _getFullTotall(List<ProductEntity> products) {
    return products.fold<Decimal>(Decimal.zero,
        (previousValue, element) => previousValue + element.decimalPrice);
  }

  // Метод _getDiscount для вычисления суммы скидки.
  Decimal _getDiscount(List<ProductEntity> products) {
    // Получаем список товаров со скидкой.
    final discount = products.where((element) => element.discount > 0).toList();
    return discount.isEmpty
        ? Decimal.zero
        : discount.fold<Decimal>(
            Decimal.zero,
            (previousValue, element) =>
                previousValue +
                _calculateDiscountXForProduct(
                  element.decimalPrice,
                  element.discount.toString(),
                ),
          );
  }

  // Метод _calculateDiscountXForProduct для расчета скидки
  // для одного товара. Скидка в %.
  Decimal _calculateDiscountXForProduct(Decimal price, String discountPercent) {
    final discountAmount =
        (price * Decimal.parse(discountPercent) / Decimal.fromInt(100))
            .toDecimal();
    return price - discountAmount;
  }
}

// Виджет для отображения данных в финансовом блоке
class _RowWidget extends StatelessWidget {
  // Объявление переменных description и value в классе _RowWidget.
  final String description;
  final String value;
  // Конструктор класса _RowWidget, который принимает параметры description и value.
  const _RowWidget({required this.description, required this.value});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Expanded(child: Text(description, style: textTheme.bodyMedium)),
        Text(value, style: textTheme.headlineSmall),
      ],
    );
  }
}
