import 'package:flutter/material.dart';
import 'package:skapi_obligations/common/extension/date_formatter_extension.dart';
import 'package:skapi_obligations/common/extension/localization_extension.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';
import 'package:skapi_obligations/features/obligations/domain/models/common_obligation/upcoming_payment_item.dart';
import 'package:skapi_obligations/features/obligations/presentation/widgets/payment_loans/skapi_expandable_item.dart';
import 'package:skapi_obligations/features/obligations/presentation/widgets/transaction_details_gold_section/transaction_details_gold_payment_amount.dart';
import 'package:skapi_obligations/features/obligations/presentation/widgets/transaction_details_gold_section/transaction_details_gold_payment_date.dart';

class TransactionDetailsGoldSection extends StatelessWidget {
  const TransactionDetailsGoldSection({
    super.key,
    required this.upcomingPayment,
  });

  final UpcomingPaymentItem upcomingPayment;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: context.skapiColors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(10.0)),
        ),
        child: ListView(
          children: [
            TransactionDetailsGoldPaymentDate(
              label: '${context.localization.paymentDetailsPaymentDate}: ',
              date: upcomingPayment.paymentDate.toFormattedDate(),
            ),
            const SizedBox(height: 10),
            TransactionDetailsGoldPaymentAmount(
              label: '${context.localization.paymentDetailsPaymentAmount}: ',
              amount: upcomingPayment.paymentAmount,
            ),
            const SizedBox(height: 8),
            SkapiExpandableItem(
              label: '${context.localization.paymentDetailsRoot}: ',
              amount: upcomingPayment.principalAmount,
            ),
            const SizedBox(height: 8),
            SkapiExpandableItem(
              label: '${context.localization.paymentDetailsPercent}: ',
              amount: upcomingPayment.percentageAmount,
            ),
            const SizedBox(height: 8),
            SkapiExpandableItem(
              label: '${context.localization.paymentDetailsFine}: ',
              amount: upcomingPayment.fineAmount,
            ),
          ],
        ),
      ),
    );
  }
}
