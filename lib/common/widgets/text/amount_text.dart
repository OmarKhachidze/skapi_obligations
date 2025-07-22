import 'package:flutter/material.dart';
import 'package:skapi_obligations/common/extension/localization_extension.dart';
import 'package:skapi_obligations/common/extension/number_extension.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';

class AmountText extends StatelessWidget {
  const AmountText({required this.label, required this.amount, super.key});

  final String label;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: label.split('$amount')[0],
        style: context.skapiTextStyles.tinyText.copyWith(
          color: context.skapiColors.grayDark,
        ),
        children: [
          TextSpan(
            text:
                ' ${amount.formatToString()} ${context.localization.currencyGel} ',
            style: context.skapiTextStyles.tinyText.copyWith(
              fontWeight: FontWeight.w700,
              color: context.skapiColors.black,
            ),
          ),
          TextSpan(text: label.split('$amount')[1]),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
