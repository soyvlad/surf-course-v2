import 'package:json_annotation/json_annotation.dart';
// Директива part, которая импортирует файл color_data.g.dart,
// который будет сгенерирован автоматически для работы
// с сериализацией/десериализацией JSON.
part 'color_data.g.dart';

// Аннотация класса ColorData, указывающая, что необходимо сгенерировать код
// только для десериализации JSON (fromJson), а не для сериализации (toJson).
@JsonSerializable(createToJson: false)
class ColorData {
  // Объявление поля класса name типа String,
  // которое будет использоваться для хранения имени цвета.
  final String name;
  // Объявление необязательного поля класса value типа String,
  // которое будет использоваться для хранения значения цвета.
  final String? value;
  // Конструктор класса ColorData, который инициализирует
  // поля name и value при создании нового объекта класса.
  ColorData(this.name, this.value);
  // Фабричный метод, который принимает карту JSON (Map<String, dynamic>)
  // и создает новый объект класса ColorData с помощью сгенерированного метода _$ColorDataFromJson.
  factory ColorData.fromJson(Map<String, dynamic> json) =>
      _$ColorDataFromJson(json);
}
