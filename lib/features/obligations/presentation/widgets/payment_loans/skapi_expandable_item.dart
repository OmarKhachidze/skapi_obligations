import 'package:flutter/material.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';

import '../../../../../common/widgets/money_text/money_text.dart';


class SkapiExpandableItem extends StatelessWidget {
  const SkapiExpandableItem({
    super.key,
    required this.label,
    required this.amount,
  });

  final String label;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 6,
      children: [
        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.skapiTextStyles.tinyText.copyWith(
            color: context.skapiColors.grayDark,
          ),
        ),
        MoneyText(
          amount: amount,
          amountTextStyle: context.skapiTextStyles.h5,
          currencyTextStyle: context.skapiTextStyles.gel.copyWith(
            fontSize: 14,
            height: 20 / 14,
            color: context.skapiColors.grayMedium,
          ),
        ),
      ],
    );
  }
}
