class UpcomingPaymentItem {
  UpcomingPaymentItem({
    required this.accountNumber,
    required this.remainingDays,
    required this.expired,
    required this.today,
    required this.paymentDate,
    required this.paymentAmount,
    required this.principalAmount,
    required this.percentageAmount,
    required this.fineAmount,
  });

  factory UpcomingPaymentItem.fromJson(Map<String, dynamic> json) {
    return UpcomingPaymentItem(
      accountNumber: json['account_number'],
      remainingDays: json['remaining_days'],
      expired: json['expired'],
      today: json['today'],
      paymentDate: json['payment_date'],
      paymentAmount: (json['payment_amount'] ?? 0).toDouble(),
      principalAmount: (json['principal_amount'] ?? 0).toDouble(),
      percentageAmount: (json['percentage_amount'] ?? 0).toDouble(),
      fineAmount: (json['fine_amount'] ?? 0).toDouble(),
    );
  }

  final String accountNumber;
  final int remainingDays;
  final bool expired;
  final bool today;
  final String paymentDate;
  final double paymentAmount;
  final double principalAmount;
  final double percentageAmount;
  final double fineAmount;
}
