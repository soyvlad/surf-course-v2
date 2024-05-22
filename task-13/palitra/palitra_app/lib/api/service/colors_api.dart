import 'package:palitra_app/api/data/color_data.dart';

// Интерфейс для api
abstract class ColorsApi {
  // Получить список цветов
  Future<List<ColorData>> getColors();
}
