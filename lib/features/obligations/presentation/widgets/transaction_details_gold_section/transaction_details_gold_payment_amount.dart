import 'package:flutter/material.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';

import '../../../../../common/widgets/money_text/money_text.dart';

class TransactionDetailsGoldPaymentAmount extends StatelessWidget {
  const TransactionDetailsGoldPaymentAmount({
    super.key,
    required this.label,
    required this.amount,
  });

  final String label;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 6,
          children: [
            Expanded(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.skapiTextStyles.bodySmall.copyWith(
                  color: context.skapiColors.grayDark,
                ),
              ),
            ),
            MoneyText(
              amount: amount,
              amountTextStyle: context.skapiTextStyles.h4,
              currencyTextStyle: context.skapiTextStyles.gel.copyWith(
                fontSize: 16,
                height: 20 / 16,
              ),
            ),
          ],
        ),
        Divider(height: 1, thickness: 1, color: context.skapiColors.grayLight),
      ],
    );
  }
}
