import 'package:intl/intl.dart';

// Extension for DateTime

extension DateTimeX on DateTime {
  String toStringDateAndTime() {
    return DateFormat('y.MM.dd в HH:mm', 'ru').format(this);
  }
}
