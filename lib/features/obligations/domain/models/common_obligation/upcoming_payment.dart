import 'package:skapi_obligations/features/obligations/domain/models/common_obligation/upcoming_payment_item.dart';

class UpcomingPayment {
  UpcomingPayment({
    required this.remainingDays,
    required this.today,
    required this.expired,
    required this.paymentAmount,
    required this.items,
    required this.paymentDate,
  });

  factory UpcomingPayment.fromJson(Map<String, dynamic> json) {
    return UpcomingPayment(
      remainingDays: json['remaining_days'] ?? 0,
      today: json['today'] ?? false,
      expired: json['expired'] ?? false,
      paymentAmount: (json['payment_amount'] ?? 0).toDouble(),
      items: (json['items'] as List<dynamic>)
          .map((e) => UpcomingPaymentItem.fromJson(e))
          .toList(),
      paymentDate: json['payment_date'] ?? '',
    );
  }

  final int remainingDays;
  final bool today;
  final bool expired;
  final double paymentAmount;
  final List<UpcomingPaymentItem> items;
  final String paymentDate;
}
