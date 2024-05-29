// Расширение для строки цвета.

import 'package:flutter/material.dart';

// Определение расширения для класса String,
// разрешающее добавлять новый метод hexToColor к объектам типа String.
extension StringHex on String {
  Color hexToColor() {
    // Создание переменной hexCode,
    // которая содержит строку без символа '#', если он присутствует в исходной строке.
    final hexCode = replaceAll('#', '');
    // Возврат объекта Color, созданного из шестнадцатеричного значения,
    // полученного из переменной hexCode.
    // Добавление 'FF' перед hexCode создает полноценное значение ARGB,
    // где FF - прозрачность, а hexCode - цветные компоненты.
    return Color(int.parse('FF$hexCode', radix: 16));
  }
}
