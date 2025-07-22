class GoldLoan {
  GoldLoan({
    required this.accountNumber,
    required this.issueAmount,
    required this.principalAmount,
    required this.issueDate,
    required this.paymentAmount,
    required this.paymentDate,
    required this.currency,
    required this.percRate,
    required this.effectiveIntRate,
    required this.monthPay30,
    required this.monthPay31,
    required this.monthPay,
    required this.fineDay,
    required this.fineAmount,
    required this.hasGraphic,
    required this.finePerc,
    required this.duration,
    this.percRatePromotion,
    this.secondMonthPay30,
    this.secondMonthPay31,
    required this.percAmount,

    // ignore: non_constant_identifier_names
    required this.fine_amount,
  });

  factory GoldLoan.fromJson(Map<String, dynamic> json) {
    return GoldLoan(
      accountNumber: json['account_number'],
      issueAmount: (json['issue_amount'] ?? 0).toDouble(),
      principalAmount: (json['principal_amount'] ?? 0).toDouble(),
      issueDate: json['issue_date'],
      paymentAmount: (json['payment_amount'] ?? 0).toDouble(),
      paymentDate: json['payment_date'],
      currency: json['currency'],
      percRate: (json['perc_rate'] ?? 0).toDouble(),
      effectiveIntRate: (json['effective_int_Rate'] ?? 0).toDouble(),
      monthPay30: (json['month_pay_30'] ?? 0).toDouble(),
      monthPay31: (json['month_pay_31'] ?? 0).toDouble(),
      monthPay: (json['month_pay'] ?? 0).toDouble(),
      fineDay: (json['fineDay'] ?? 0).toDouble(),
      fineAmount: (json['fineAmount'] ?? 0).toDouble(),
      hasGraphic: json['has_graphic'] ?? false,
      finePerc: (json['fine_perc'] ?? 0).toDouble(),
      duration: json['duration'],
      percRatePromotion: (json['perc_rate_promotion'] as num?)?.toDouble(),
      secondMonthPay30: (json['second_month_pay30'] as num?)?.toDouble(),
      secondMonthPay31: (json['second_month_pay31'] as num?)?.toDouble(),
      percAmount: (json['perc_amount'] ?? 0).toDouble(),
      fine_amount: (json['fine_amount'] ?? 0).toDouble(),
    );
  }

  final String accountNumber;
  final double issueAmount;
  final double principalAmount;
  final String issueDate;
  final double paymentAmount;
  final String paymentDate;
  final String currency;
  final double percRate;
  final double effectiveIntRate;
  final double monthPay30;
  final double monthPay31;
  final double monthPay;
  final double fineDay;
  final double fineAmount;
  final bool hasGraphic;
  final double finePerc;
  final int duration;
  final double? percRatePromotion;
  final double? secondMonthPay30;
  final double? secondMonthPay31;
  final double percAmount;

  // ignore: non_constant_identifier_names
  final double fine_amount;
}
