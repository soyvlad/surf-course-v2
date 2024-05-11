// Расширение для сортировки списка продуктов.
import 'package:shestyorochka_app/domain/entity/product_entity.dart';
import 'package:shestyorochka_app/domain/entity/sorting_type.dart';

extension ProductListX on List<ProductEntity> {
  List<ProductEntity> sortByFilter(SortingType type) {
    final List<ProductEntity> sortedList = switch (type) {
      SortingType.none => this,
      SortingType.nameFromA => _sortByName(this),
      SortingType.nameFromZ => _sortByName(this, isfromA: false),
      SortingType.ascendingOrderPrice => _sortByPrice(this),
      SortingType.descendingOrderPrice =>
        _sortByPrice(this, isCheapFirst: false),
      SortingType.typeFromA => this,
      SortingType.typeFromZ => this,
    };
    return sortedList;
  }

  // По умолчанию сначала дешёвый товар.
  List<ProductEntity> _sortByPrice(List<ProductEntity> initialList,
      {bool isCheapFirst = true}) {
    final result = initialList;

    result.sort(
      (a, b) => isCheapFirst
          ? a.decimalPrice.compareTo(b.decimalPrice)
          : b.decimalPrice.compareTo(a.decimalPrice),
    );
    return result;
  }

  List<ProductEntity> _sortByName(List<ProductEntity> initialList,
      {bool isfromA = true}) {
    final result = initialList;

    result.sort((a, b) =>
        isfromA ? a.title.compareTo(b.title) : b.title.compareTo(a.title));
    return result;
  }
}
