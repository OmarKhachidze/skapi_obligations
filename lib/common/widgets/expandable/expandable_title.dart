import 'package:flutter/material.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';

import '../../../features/obligations/presentation/widgets/upcoming_payment_section/upcoming_payment_icon.dart';
import '../../../features/obligations/presentation/widgets/upcoming_payment_section/upcoming_payment_label_pay_day.dart';
import '../money_text/money_text.dart';

class ExpandableTitle extends StatelessWidget {
  const ExpandableTitle({
    required this.iconPath,
    required this.label,
    required this.subLabel,
    required this.days,
    required this.amount,
    super.key,
  });

  final String iconPath;
  final String label;
  final String subLabel;
  final String days;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        UpcomingPaymentIcon(
          iconPath: iconPath,
          width: 40.0,
          height: 32.0,
          iconSize: 28.0,
          padding: EdgeInsets.zero,
          backgroundColor: context.skapiColors.primaryLight,
        ),
        UpcomingPaymentLabelPayDay(
          label: label,
          subLabel: subLabel,
          days: days,
          spaceBetweenLabels: 0,
          labelStyle: context.skapiTextStyles.tinyText.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            height: 20 / 12,
            color: context.skapiColors.black,
          ),
          subLabelStyle: context.skapiTextStyles.tinyText.copyWith(
            fontSize: 11,
            height: 16 / 11,
            color: context.skapiColors.grayDark,
          ),
          hasPassed: false,
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
    );
  }
}
