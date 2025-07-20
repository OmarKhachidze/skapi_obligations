import 'package:flutter/material.dart';
import 'package:skapi_obligations/common/extension/localization_extension.dart';
import 'package:skapi_obligations/common/extension/number_extension.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';

class MoneyText extends StatelessWidget {
  const MoneyText({
    required this.amount,
    this.amountTextStyle,
    this.currencyTextStyle,
    super.key,
  });

  final double amount;
  final TextStyle? amountTextStyle;
  final TextStyle? currencyTextStyle;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: amount.formatToString(),
        style:
            amountTextStyle?.copyWith(color: context.skapiColors.black) ??
            context.skapiTextStyles.h2.copyWith(
              color: context.skapiColors.black,
            ),
        children: [
          const WidgetSpan(child: SizedBox(width: 4)),
          TextSpan(
            text: context.localization.currencyGel,
            style:
                currencyTextStyle?.copyWith(
                  color: context.skapiColors.grayMedium,
                ) ??
                context.skapiTextStyles.gel.copyWith(
                  color: context.skapiColors.grayMedium,
                ),
          ),
        ],
      ),
    );
  }
}
