// Расширение которое будет форматировать цену в денежный формат
import 'package:decimal/decimal.dart';
import 'package:shestyorochka_app/utils/decimal_currency.dart';


extension DoubleX on double {
  String doubleToDecimalToFormattedCurrency() {
    Decimal price = Decimal.parse(toString());
    return price.toFormattedCurrency();
  }
}