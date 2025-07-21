import 'package:skapi_obligations/features/obligations/domain/models/other_obligation/other_loan.dart';

import '../../features/obligations/domain/models/gold_obligation/gold_loan.dart';

extension SumOtherLoanExtension on List<OtherLoan> {
  double get loanSum =>
      fold<double>(0.00, (sum, item) => sum + item.issueAmount);
}

extension SumGoldLoanExtension on List<GoldLoan> {
  double get loanSum =>
      fold<double>(0.00, (sum, item) => sum + item.issueAmount);
}
