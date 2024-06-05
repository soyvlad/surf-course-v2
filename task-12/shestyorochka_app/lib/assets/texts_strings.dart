class AppTexts {
  // Measure units.
  static const rub = 'руб.', pieces = 'шт.', kg = 'кг', space = ' ';

  // List products
  static const listPurchases = 'Список покупок';

  // Other screens
  static const emptyScreen = 'Пустой экран';

  // NavBottomBar_Screen
  static const catalogue = 'Каталог',
      search = 'Поиск',
      basket = 'Корзина',
      personal = 'Личное';

  // HomeScreen
  static const receipt = 'Чек № ';
  static String discountPercentage(int percentage) => 'Скидка $percentage %';

  // FinancialWidget
  static const inYourPurchase = 'В вашей покупке',
      discount = 'Скидка',
      total = 'Итого';

  static const noProducts = 'нет товаров';
  static String oneProduct(int count) => '$count товар';
  static String fewProducts(int count) => '$count товара';
  static String manyProducts(int count) => '$count товаров';
  static String otherProducts(int count) => '$count тoвapa';

  // ErrorWidget
  static const error = 'Произошла ошибка!';

  // Filter_screen
  static const done = 'Готово', sorting = 'Сортировка';

  // Sorting_type
  static const noneSorting = 'Без сортировки',
      nameFromAToZ = 'По имени от А до Я',
      nameFromZToA = 'По имени от Я до А',
      ascendingOrder = 'По возрастанию',
      descendingOrder = 'По убыванию',
      typeFromAToZ = 'По типу от А до Я',
      typeFromZToA = 'По типу от Я до А';

  static const byName = 'По имени', byPrice = 'По цене', byType = 'По типу';
}
