part of 'color_data.dart';

// Определяем функцию _$ColorDataFromJson, которая принимает Map<String, dynamic> json
// в качестве аргумента. Функция возвращает объект типа ColorData.
ColorData _$ColorDataFromJson(Map<String, dynamic> json) => ColorData(
      // Внутри функции происходит создание объекта ColorData,
      // используя значения из поля 'name' и 'value' в json.
      // Поле 'name' преобразуется в строку, а поле 'value' может быть как строкой, так и null.
      json['name'] as String,
      json['value'] as String?,
    );
