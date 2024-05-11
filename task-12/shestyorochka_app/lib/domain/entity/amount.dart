// Класс, описывающий количество товаров

sealed class Amount {
  int get value;
}

// Класс, описывающий количество товаров в граммах

class Grams implements Amount {
  @override
  final int value;
  Grams(this.value);
}
// Класс, описывающий количество товаров в штуках

class Quantity implements Amount {
  @override
  final int value;
  Quantity(this.value);
}
