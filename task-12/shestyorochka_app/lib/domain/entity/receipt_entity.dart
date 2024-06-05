import 'package:shestyorochka_app/domain/entity/product_entity.dart';

// Модель чека
// Содержит данные: номер, дату, список покупок

class ReceiptEntity {
  final int id;
  final DateTime date;
  final List<ProductEntity> products;

  ReceiptEntity(
      {required this.id, required this.date, required this.products});
}
