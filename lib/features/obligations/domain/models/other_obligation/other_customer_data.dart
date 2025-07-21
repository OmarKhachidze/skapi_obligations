import '../common_obligation/upcoming_payment.dart';
import 'other_loan.dart';

class OtherCustomerData {
  OtherCustomerData({
    required this.customerName,
    required this.transitGEL,
    required this.transitBalance,
    required this.expense,
    required this.expenseDetail,
    required this.taxAmount,
    required this.loans,
    required this.upcoming,
  });

  factory OtherCustomerData.fromJson(Map<String, dynamic> json) {
    return OtherCustomerData(
      customerName: json['customerName'] ?? '',
      transitGEL: json['transit_GEL'] ?? '',
      transitBalance: json['transit_balance'] ?? 0,
      expense: json['expense'] ?? 0,
      expenseDetail: json['expense_detail'] ?? [],
      taxAmount: (json['tax_amount'] ?? 0).toDouble(),
      loans: (json['loans'] as List<dynamic>)
          .map((e) => OtherLoan.fromJson(e))
          .toList(),
      upcoming: UpcomingPayment.fromJson(json['upcoming']),
    );
  }

  final String customerName;
  final String transitGEL;
  final num transitBalance;
  final num expense;
  final List<dynamic> expenseDetail;
  final double taxAmount;
  final List<OtherLoan> loans;
  final UpcomingPayment upcoming;
}
