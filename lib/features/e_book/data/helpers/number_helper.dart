import 'package:intl/intl.dart';

class NumberHelper {
  static String addSeparator(int number) {
    final result = NumberFormat('#,###').format(number);
    return result;
  }
}