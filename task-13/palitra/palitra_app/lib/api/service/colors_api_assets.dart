import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:palitra_app/api/colors_api_urls.dart';
import 'package:palitra_app/api/data/color_data.dart';
import 'package:palitra_app/api/service/colors_api.dart';

// Объявление класса ColorsApiAssets, который реализует интерфейс ColorsApi.
class ColorsApiAssets implements ColorsApi {
  @override
  // Объявление асинхронного метода getColors,
  // который возвращает Future<List<ColorData>> и загружает список цветов.
  Future<List<ColorData>> getColors() async {
    // Объявление переменной colors, которая представляет список объектов ColorData.
    final colors = <ColorData>[];
    // Ожидание задержки в 1500 миллисекунд.
    await _addDelay(1500);
    // Загрузка строки JSON из файла asset с указанным путем ColorsApiUrls.colors.
    final jsonString = await _loadAsset(ColorsApiUrls.colors);
    // Декодирование JSON-строки в Map<String, dynamic> объект data.
    final data = jsonDecode(jsonString) as Map<String, dynamic>;
    // Получение списка цветов из объекта data.
    final colorsData = data['colors'] as List;
    // Проверка, что список цветов не пустой.
    if (colorsData.isNotEmpty) {
      // Цикл перебора элементов списка цветов.
      for (final e in colorsData) {
        // Добавление объекта ColorData, созданного из элемента списка, в список colors.
        colors.add(ColorData.fromJson(e as Map<String, dynamic>));
      }
    }
    // Возвращение списка цветов.
    return colors;
  }

  // Определение приватного метода _loadAsset, который загружает строку
  // из asset по указанному пути.
  Future<String> _loadAsset(String path) => rootBundle.loadString(path);

  // Определение приватного метода _addDelay, который имитирует задержку
  // на указанное количество миллисекунд.
  Future<void> _addDelay(int ms) =>
      Future<void>.delayed(Duration(milliseconds: ms));
}
