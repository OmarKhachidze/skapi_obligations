class OtherLoan {
  OtherLoan({
    required this.accountNumber,
    required this.principalDue,
    required this.interestDue,
    required this.penalty,
    required this.sumAmount,
    required this.description,
    required this.repaymentDate,
    required this.currency,
    required this.openingBalance,
    required this.arrearsDays,
    required this.issueDate,
    required this.issueAmount,
    required this.effectiveInterestRate,
    required this.issueFeeAmount,
  });

  factory OtherLoan.fromJson(Map<String, dynamic> json) {
    return OtherLoan(
      accountNumber: json['account_number'],
      principalDue: (json['principalDue'] ?? 0).toDouble(),
      interestDue: (json['interestDue'] ?? 0).toDouble(),
      penalty: (json['penalty'] ?? 0).toDouble(),
      sumAmount: (json['sum_amount'] ?? 0).toDouble(),
      description: json['description'] ?? '',
      repaymentDate: json['repayment_date'] ?? '',
      currency: json['currency'] ?? '',
      openingBalance: json['openingBalance'] ?? 0,
      arrearsDays: json['arrearsDays'] ?? 0,
      issueDate: json['IssueDate'] ?? '',
      issueAmount: json['IssueAmount'] ?? 0,
      effectiveInterestRate: (json['effective_int_Rate'] != null)
          ? double.tryParse(json['effective_int_Rate'].toString())
          : null,
      issueFeeAmount: (json['issue_fee_amount'] ?? 0).toDouble(),
    );
  }

  final String accountNumber;
  final double principalDue;
  final double interestDue;
  final double penalty;
  final double sumAmount;
  final String description;
  final String repaymentDate;
  final String currency;
  final num openingBalance;
  final int arrearsDays;
  final String issueDate;
  final num issueAmount;
  final double? effectiveInterestRate;
  final double issueFeeAmount;
}
