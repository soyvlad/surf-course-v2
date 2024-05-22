// Маппер сущностей
import 'package:palitra_app/api/data/color_data.dart';
import 'package:palitra_app/entity/color_entity.dart';

final class ColorMapper {
  // Создается метод mapColors, который принимает список объектов
  // типа ColorData и возвращает список объектов типа ColorEntity.
  List<ColorEntity> mapColors(List<ColorData> data) {
    // Создается пустой список mappedList,
    // который будет содержать сопоставленные объекты.
    final mappedList = <ColorEntity>[];
    for (var e in data) {
      // Для каждого элемента e в списке data вызывается
      // метод _mapColor для сопоставления цвета.
      final entity = _mapColor(e);
      // Если результат сопоставления не равен null,
      // то он добавляется в список mappedList.
      if (entity != null) mappedList.add(entity);
    }
    // Возвращается список mappedList, содержащий все сопоставленные объекты цветов.
    return mappedList;
  }

  // Создается приватный метод _mapColor, который принимает
  // объект ColorData и возвращает объект ColorEntity или null.
  ColorEntity? _mapColor(ColorData data) {
    // Получается значение цвета из data.value.
    final value = data.value;
    // Если значение value равно null, метод возвращает null.

    if (value == null) return null;
    // Создается объект ColorEntity, используя имя цвета
    // из data.name и значение цвета value.

    // Возвращается объект ColorEntity.
    return ColorEntity(
      name: data.name,
      value: value,
    );
  }
}
