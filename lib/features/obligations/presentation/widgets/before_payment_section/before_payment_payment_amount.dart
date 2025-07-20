import 'package:flutter/material.dart';
import 'package:skapi_obligations/common/extension/localization_extension.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';

import '../../../../../common/constants/svg_assets.dart';
import '../../../../../common/widgets/money_text/money_text.dart';
import '../upcoming_payment_section/upcoming_payment_icon.dart';
import '../upcoming_payment_section/upcoming_payment_label_pay_day.dart';

class BeforePaymentPaymentAmount extends StatelessWidget {
  const BeforePaymentPaymentAmount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 12.0),
      padding: const EdgeInsets.only(
        left: 16.0,
        top: 10.0,
        right: 10.0,
        bottom: 10.0,
      ),
      decoration: BoxDecoration(
        color: context.skapiColors.grayVeryLight,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(12.0),
        ),
      ),
      child: Row(
        spacing: 10,
        children: [
          UpcomingPaymentIcon(
            iconPath: SvgAssets.otherObligations,
            width: 40.0,
            height: 32.0,
            iconSize: 32.0,
            padding: EdgeInsets.zero,
            backgroundColor: context.skapiColors.primaryLight,
          ),
          UpcomingPaymentLabelPayDay(
            label: 'სხვა სესხები',
            subLabel:
                '${context.localization.paymentDetailsBeforePaymentLastDate}:',
            days: '7 დღეში',
            spaceBetweenLabels: 0,
            labelStyle: context.skapiTextStyles.h5.copyWith(
              color: context.skapiColors.black,
            ),
            subLabelStyle: context.skapiTextStyles.tinyText.copyWith(
              fontSize: 12,
              height: 18 / 12,
              color: context.skapiColors.grayDark,
            ),
            hasPassed: false,
          ),
          MoneyText(
            amount: 10_558.29,
            amountTextStyle: context.skapiTextStyles.h4,
            currencyTextStyle: context.skapiTextStyles.gel.copyWith(
              fontSize: 16,
              height: 20 / 16,
            ),
          ),
        ],
      ),
    );
  }
}
