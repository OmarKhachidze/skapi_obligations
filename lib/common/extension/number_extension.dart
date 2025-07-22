import 'package:intl/intl.dart';

extension NumberExtension on double {
  String formatToString([int decimalDigits = 2]) =>
      NumberFormat.decimalPatternDigits(
        locale: 'en',
        decimalDigits: decimalDigits,
      ).format(this);
}
