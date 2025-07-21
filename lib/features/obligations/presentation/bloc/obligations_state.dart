import 'package:skapi_obligations/common/extension/dio_exception_extension.dart';
import 'package:skapi_obligations/features/obligations/domain/models/other_obligation/other_customer_data.dart';
import '../../domain/models/gold_obligation/gold_customre_data.dart';

class ObligationsData {
  const ObligationsData({
    this.otherObligations,
    this.goldObligations,
    this.transactions,
    this.isLoadingOther = false,
    this.isLoadingGold = false,
    this.isLoadingTransactions = false,
    this.error,
  });

  final OtherCustomerData? otherObligations;
  final GoldCustomerData? goldObligations;
  final List<int>? transactions;
  final bool isLoadingOther;
  final bool isLoadingGold;
  final bool isLoadingTransactions;
  final SkapiErrorType? error;

  ObligationsData copyWith({
    OtherCustomerData? otherObligations,
    GoldCustomerData? goldObligations,
    List<int>? transactions,
    bool? isLoadingOther,
    bool? isLoadingGold,
    bool? isLoadingTransactions,
    SkapiErrorType? error,
    bool clearError = false,
  }) => ObligationsData(
    otherObligations: otherObligations ?? this.otherObligations,
    goldObligations: goldObligations ?? this.goldObligations,
    transactions: transactions ?? this.transactions,
    isLoadingOther: isLoadingOther ?? this.isLoadingOther,
    isLoadingGold: isLoadingGold ?? this.isLoadingGold,
    isLoadingTransactions: isLoadingTransactions ?? this.isLoadingTransactions,
    error: clearError ? null : (error ?? this.error),
  );

  bool get hasAnyLoading =>
      isLoadingOther || isLoadingGold || isLoadingTransactions;
}
