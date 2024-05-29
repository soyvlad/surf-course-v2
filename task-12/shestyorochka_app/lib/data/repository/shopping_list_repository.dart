import 'package:shestyorochka_app/data/mock_data.dart';
import 'package:shestyorochka_app/domain/entity/receipt_entity.dart';

// Репозиторий для получения данных
class ShoppingListRepository {
  // Получить чек по номеру
  Future<ReceiptEntity> getReceipt(int id) async {
    return Future.value(ReceiptEntity(
      id: id,
      date: DateTime.now(),
      products: dataForStudents,
    ));
  }
}
