import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:shestyorochka_app/assets/colors.dart';
import 'package:shestyorochka_app/assets/texts_strings.dart';
import 'package:shestyorochka_app/domain/entity/product_entity.dart';
import 'package:shestyorochka_app/domain/entity/receipt_entity.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:shestyorochka_app/domain/entity/sorting_type.dart';
import 'package:shestyorochka_app/main.dart';
import 'package:shestyorochka_app/domain/entity/sorted_products.dart';
import 'package:shestyorochka_app/screens/sort_wth_cat_screen.dart';
import 'package:shestyorochka_app/utils/date_time.dart';
import 'package:shestyorochka_app/screens/filter_screen.dart';
import 'package:shestyorochka_app/utils/decimal_currency.dart';
import 'package:intl/intl.dart';
import 'package:shestyorochka_app/screens/sort_cat_screen.dart';

// Номер чека в себя принимает.

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = shoppingListRepository.getReceipt(56);
    // Использование FutureBuilder для построения виджетов
    // в зависимости от состояния полученного Future данных.
    return FutureBuilder(
        future: data,
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const _ErrorWidget();
            } else if (snapshot.hasData) {
              final data = snapshot.data as ReceiptEntity;
              return _ContentWidget(
                data: data,
              );
            }
          }
          return const _LoadingWidget();
        });
  }
}

class _ContentWidget extends StatefulWidget {
  final ReceiptEntity data;
  const _ContentWidget({required this.data});

  @override
  State<_ContentWidget> createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<_ContentWidget> {
  SortingType _currentFilter = SortingType.none;
  SortedProducts products = ProductsWithoutCategory(data: []);

  @override
  void initState() {
    products = ProductsWithoutCategory(data: List.from(widget.data.products));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.brightGreen,
          ),
          onPressed: () {},
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('${AppTexts.receipt} ${widget.data.id}',
                style: Theme.of(context).textTheme.titleLarge),
            Text(widget.data.date.toStringDateAndTime(),
                style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppTexts.listPurchases,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: 38,
                  height: 38,
                  child: IconButton(
                    onPressed: () {
                      _onPressFilter(context);
                    },
                    icon: const Icon(
                      Icons.sort,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            if (products is ProductsWithoutCategory)
              SortWithoutCategoryScreen(products: products.data),
            if (products is ProductsWithCategory)
              SortCategoryScreen(
                productsByCategoryMap: products.data,
                products: const {},
              ),
            _FinancialWidget(products: widget.data.products),
          ],
        ),
      ),
    );
  }

  // Обработка события нажатия на кнопку сортировки в методе _onPressFilter.
  Future<void> _onPressFilter(BuildContext context) async {
    final SortingType? filter = await showFlexibleBottomSheet(
      initHeight: 0.85,
      maxHeight: 0.85,
      bottomSheetColor: AppColors.white,
      context: context,
      builder: (
        _,
        __,
        ___,
      ) =>
          FilterScreen(filter: _currentFilter),
      isExpand: false,
      bottomSheetBorderRadius: const BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      ),
    );

    if (filter == null) return;
    if (filter != _currentFilter) {
      setState(() {
        _currentFilter = filter;
        _sortProduct();
      });
    }
  }

  // Метод _sortProduct сортирует продукты в зависимости от выбранного фильтра.
  void _sortProduct() {
    switch (_currentFilter) {
      case SortingType.none:
        products = ProductsWithoutCategory(
          data: List.from(widget.data.products),
        );

      case SortingType.nameFromA:
        final data = List<ProductEntity>.from(widget.data.products);
        data.sort(
          (a, b) => a.title.compareTo(b.title),
        );
        products = ProductsWithoutCategory(data: data);

      case SortingType.nameFromZ:
        final data = List<ProductEntity>.from(widget.data.products);
        data.sort(
          (a, b) => b.title.compareTo(a.title),
        );
        products = ProductsWithoutCategory(data: data);

      case SortingType.ascendingOrderPrice:
        final data = List<ProductEntity>.from(widget.data.products);
        data.sort(
          (a, b) => a.price.compareTo(b.price),
        );
        products = ProductsWithoutCategory(data: data);

      case SortingType.descendingOrderPrice:
        final data = List<ProductEntity>.from(widget.data.products);
        data.sort(
          (a, b) => b.price.compareTo(a.price),
        );
        products = ProductsWithoutCategory(data: data);

      case SortingType.typeFromA:
        final data = List<ProductEntity>.from(widget.data.products);
        data.sort(
          (a, b) => a.category.name.compareTo(b.category.name),
        );
        products = ProductsWithCategory(data: data);
      case SortingType.typeFromZ:
        final data = List<ProductEntity>.from(widget.data.products);
        data.sort(
          (a, b) => b.category.name.compareTo(a.category.name),
        );
        products = ProductsWithCategory(data: data);
    }
  }
}

class _FinancialWidget extends StatelessWidget {
  final List<ProductEntity> products;
  // Объявление конструктора _FinancialWidget с обязательным параметром products.
  const _FinancialWidget({
    required this.products,
  });
  @override
  Widget build(BuildContext context) {
    final fullTotal = _getFullTotal(products);
    final discount = _getDiscount(products);
    final total = fullTotal - discount;
    final discountPercentage =
        ((1 - (fullTotal.toDouble() / total.toDouble())) * 100).ceil();
    // Построение интерфейса с помощью виджетов Column, Align, _RowWidget для отображения финансовых данных.
    return Column(
      children: [
        const Divider(),
        Align(
          alignment: Alignment.topLeft,
          child: Text(AppTexts.inYourPurchase,
              style: Theme.of(context).textTheme.titleLarge),
        ),
        _RowWidget(
          description: _plural(products.length),
          value: fullTotal.toFormattedCurrency(),
        ),
        _RowWidget(
          description: AppTexts.discountPercentage(discountPercentage),
          value: discount.toFormattedCurrency(),
        ),
        _RowWidget(
          description: AppTexts.total,
          value: total.toFormattedCurrency(),
        ),
      ],
    );
  }

  // Склонение слова 'товар'.
  String _plural(int count) {
    return Intl.plural(
      count,
      zero: AppTexts.noProducts,
      one: AppTexts.oneProduct(count),
      few: AppTexts.fewProducts(count),
      many: AppTexts.manyProducts(count),
      other: AppTexts.otherProducts(count),
      locale: 'ru',
    );
  }

  // Метод _getFullTotal возвращает общую стоимость товаров.
  Decimal _getFullTotal(List<ProductEntity> products) {
    return products.fold<Decimal>(Decimal.zero,
        (previousValue, element) => previousValue + element.decimalPrice);
  }

  // Метод _getDiscount возвращает сумму скидки для товаров со скидкой.
  Decimal _getDiscount(List<ProductEntity> product) {
    // Получаем список товаров со скидкой.
    final discount = products.where((element) => element.discount > 0).toList();
    return discount.isEmpty
        ? Decimal.zero
        : discount.fold<Decimal>(
            Decimal.zero,
            (previousValue, element) =>
                previousValue +
                _calculateDiscountForProduct(
                  element.decimalPrice,
                  element.discount.toString(),
                ),
          );
  }

  // Метод _calculateDiscountForProduct расчитывает скидку для одного товара.
  Decimal _calculateDiscountForProduct(Decimal price, String discountPercent) {
    final discountAmount =
        (price * Decimal.parse(discountPercent) / Decimal.fromInt(100))
            .toDecimal();
    return price - discountAmount;
  }
}

// Виджет для отображения данных в финансовом блоке.
class _RowWidget extends StatelessWidget {
  final String description;
  final String value;

  const _RowWidget({required this.description, required this.value});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Expanded(
          child: Text(description, style: textTheme.bodyMedium),
        ),
        Text(value, style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }
}

// Объявление класса _LoadingWidget для отображения индикатора загрузки.
class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

// Объявление класса _ErrorWidget для отображения сообщения об ошибке.
class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(AppTexts.error),
    );
  }
}
