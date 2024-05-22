// Репозиторий для получения данных

import 'package:palitra_app/api/service/colors_api.dart';
import 'package:palitra_app/data/mapper/color_mapper.dart';
import 'package:palitra_app/entity/color_entity.dart';

// Создаем финальный класс ColorsRepository.
final class ColorsRepository {
  // Объявляем приватные финальные переменные _colorsApi и _colorsMapper,
  // которые будут использоваться внутри класса.
  final ColorsApi _colorsApi;
  final ColorMapper _colorsMapper;
  // Создаем конструктор ColorsRepository с параметрами colorsApi (объект типа ColorsApi)
  // и colorsMapper (объект типа ColorMapper).
  ColorsRepository({
    required ColorsApi colorsApi,
    required ColorMapper colorsMapper,
    // В конструкторе инициализируются приватные переменные _colorsApi и _colorsMapper значениями,
    // переданными в конструкторе.
  })  : _colorsApi = colorsApi,
        _colorsMapper = colorsMapper;
  // Создаем асинхронный метод getColors, который возвращает Future<List<ColorEntity>>.
  // Метод вызывает метод getColors() из _colorsApi
  // и после получения данных применяет метод mapColors из _colorsMapper
  // для преобразования данных в список объектов ColorEntity.
  Future<List<ColorEntity>> getColors() =>
      _colorsApi.getColors().then(_colorsMapper.mapColors);
}
