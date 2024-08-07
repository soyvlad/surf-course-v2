import 'package:flutter/material.dart';
import 'package:shestyorochka_app/domain/entity/category_type.dart';
import 'package:shestyorochka_app/domain/entity/product_entity.dart';
import 'package:shestyorochka_app/screens/card_screen.dart';


class SortCategoryScreen extends StatelessWidget {
const SortCategoryScreen({required this.products, super.key, required List<ProductEntity> productsByCategoryMap});


  final Map<CategoryType, List<ProductEntity>> products;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: products.keys.length,
        itemBuilder: (_, indexGroup) =>
            _CategoryGroup(products: products, indexGroup: indexGroup),
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }
}

class _CategoryGroup extends StatelessWidget {
  const _CategoryGroup({required this.products, required this.indexGroup});

  final Map<CategoryType, List<ProductEntity>> products;
  final int indexGroup;

  @override
  Widget build(BuildContext context) {
    final categoryKey = products.keys.elementAt(indexGroup);
    final productsInCategory = products[categoryKey];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            categoryKey.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        _ProductList(productsInCategory: productsInCategory),
      ],
    );
  }
}

class _ProductList extends StatelessWidget {
  const _ProductList({required this.productsInCategory});

  final List<ProductEntity>? productsInCategory;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: productsInCategory?.length ?? 0,
      itemBuilder: (_, indexProduct) =>
          CardScreen(product: productsInCategory![indexProduct]),
    );
  }
}

