import 'package:flutter/material.dart';
import 'package:skapi_obligations/common/extension/localization_extension.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';
import '../../../../../common/widgets/money_text/money_text.dart';

class AvailableAmount extends StatelessWidget {
  const AvailableAmount({required this.amount, super.key});

  final double amount;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          context.localization.obligationsAvailableAmount,
          style: context.skapiTextStyles.h5.copyWith(
            color: context.skapiColors.black,
          ),
        ),
        Flexible(
          child: Container(
            margin: const EdgeInsets.only(left: 12.0),
            padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
            decoration: BoxDecoration(
              color: context.skapiColors.white,
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: MoneyText(
              amount: amount,
              amountTextStyle: context.skapiTextStyles.h4,
              currencyTextStyle: context.skapiTextStyles.gel.copyWith(
                fontSize: 14,
                height: 20 / 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
