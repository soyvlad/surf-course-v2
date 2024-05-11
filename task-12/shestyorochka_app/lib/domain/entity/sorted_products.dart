import 'package:collection/collection.dart';
import 'package:shestyorochka_app/domain/entity/category_type.dart';
import 'package:shestyorochka_app/domain/entity/product_entity.dart';

abstract class SortedProducts {
  List<ProductEntity> get data;
}

class ProductsWithoutCategory extends SortedProducts {
  final List<ProductEntity> _data;

  ProductsWithoutCategory({required List<ProductEntity> data}) : _data = data;

  @override
  List<ProductEntity> get data => _data;
}

class ProductsWithCategory extends SortedProducts {
  final List<ProductEntity> _data;

  ProductsWithCategory({required List<ProductEntity> data}) : _data = data;

  Map<CategoryType, List<ProductEntity>> get productsByCategoryMap {
    return groupBy(_data, (product) => product.category);
  }

  @override
  List<ProductEntity> get data => _data;
}
