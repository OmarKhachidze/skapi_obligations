import '../common_obligation/upcoming_payment.dart';
import 'gold_loan.dart';

class GoldCustomerData {
  GoldCustomerData({
    required this.customerName,
    required this.phone,
    required this.totalPayment,
    required this.loans,
    required this.upcoming,
  });

  factory GoldCustomerData.fromJson(Map<String, dynamic> json) {
    return GoldCustomerData(
      customerName: json['customerName'],
      phone: json['phone'],
      totalPayment: (json['total_payment'] ?? 0).toDouble(),
      loans: (json['loans'] as List<dynamic>)
          .map((e) => GoldLoan.fromJson(e))
          .toList(),
      upcoming: UpcomingPayment.fromJson(json['upcoming']),
    );
  }

  final String customerName;
  final String phone;
  final double totalPayment;
  final List<GoldLoan> loans;
  final UpcomingPayment upcoming;
}
