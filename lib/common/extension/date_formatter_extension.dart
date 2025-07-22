import 'package:intl/intl.dart';

extension DateFormatterExtension on String {
  String toFormattedDate() {
    try {
      final date = DateFormat('yyyy-MM-dd').parse(this);
      return DateFormat('dd/MM/yyyy').format(date);
    } catch (e) {
      return this;
    }
  }
}
