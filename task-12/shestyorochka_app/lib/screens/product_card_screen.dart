import 'package:flutter/material.dart';
import 'package:shestyorochka_app/assets/colors.dart';
import 'package:shestyorochka_app/utils/double.dart';

class ProductCardScreen extends StatelessWidget {
  // Конструктор для класса ProductCardScreen, принимает обязательные параметры:
  // imageURL, title, quantityText, priceText, и discount.
  const ProductCardScreen({
    super.key,
    required this.imageURL,
    required this.title,
    required this.quantityText,
    required this.priceText,
    required this.discount,
  });
  // Объявление финальных полей imageURL, title, quantityText,
  // priceText, и discount для класса ProductCardScreen.
  final String imageURL;
  final String title;
  final String quantityText;
  final double priceText;
  final double discount;
  // Метод build для класса ProductCardScreen, который возвращает
  // виджет Padding, содержащий виджет SizedBox, Row и два дочерних виджета.
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _ProductImage(imageURL: imageURL),
            const SizedBox(width: 20),
            Expanded(
                child: _ProductDetails(
                    title: title,
                    quantityText: quantityText,
                    priceText: priceText,
                    discount: discount)),
          ],
        ),
      ),
    );
  }
}

// Класс _ProductImage наследуется от StatelessWidget.
class _ProductImage extends StatelessWidget {
  // Конструктор для класса _ProductImage,
  // принимает обязательный параметр imageURL.
  const _ProductImage({required this.imageURL});
  // Объявление финального поля imageURL для класса _ProductImage.
  final String imageURL;
  // Метод build для класса _ProductImage, который возвращает
  // виджет SizedBox, содержащий ClipRRect и Image.network.
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageURL,
              width: 68,
              height: 68,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            )));
  }
}

class _ProductDetails extends StatelessWidget {
  const _ProductDetails(
      {required this.title,
      required this.quantityText,
      required this.priceText,
      required this.discount});
  final String title;
  final String quantityText;
  final double priceText;
  final double discount;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(quantityText, style: Theme.of(context).textTheme.bodyMedium),
            PriceText(priceText: priceText, sale: discount),
          ],
        ),
      ],
    );
  }
}

class PriceText extends StatelessWidget {
  // Конструктор для класса PriceText, принимает обязательные параметры: priceText и sale.
  const PriceText({super.key, required this.priceText, required this.sale});
  final double priceText;
  final double sale;

  // Метод build для класса PriceText, который возвращает виджет Text или Row
  // в зависимости от скидки, выводящий цену и скидку.
  @override
  Widget build(BuildContext context) {
    final discount = priceText - (priceText * sale / 100);
    if (sale == 0) {
      return Text(priceText.doubleToDecimalToFormattedCurrency(),
          style: Theme.of(context).textTheme.titleSmall);
    } else {
      final discountedPrice = discount.doubleToDecimalToFormattedCurrency();
      return Row(
        children: [
          Text(
            priceText.doubleToDecimalToFormattedCurrency(),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
          ),
          const SizedBox(width: 20),
          Text(
            discountedPrice,
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: AppColors.red),
          ),
        ],
      );
    }
  }
}
