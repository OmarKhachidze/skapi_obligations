import 'package:flutter/material.dart';
import 'package:skapi_obligations/common/extension/localization_extension.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';
import 'package:skapi_obligations/features/obligations/domain/models/common_obligation/upcoming_payment_item.dart';

import '../../../../../common/constants/svg_assets.dart';
import '../../../../../common/widgets/money_text/money_text.dart';
import '../../../domain/models/common_obligation/upcoming_payment.dart';
import '../upcoming_payment_section/upcoming_payment_icon.dart';
import '../upcoming_payment_section/upcoming_payment_label_pay_day.dart';

class BeforePaymentPaymentAmount extends StatelessWidget {
  const BeforePaymentPaymentAmount({super.key, required this.paymentData});

  final dynamic paymentData;

  @override
  Widget build(BuildContext context) {
    final goldObligation = paymentData is UpcomingPaymentItem;
    final isExpired = goldObligation
        ? paymentData.expired
        : paymentData.expired;
    final remainingDays = goldObligation
        ? paymentData.remainingDays
        : (paymentData as UpcomingPayment).remainingDays;
    final amount = goldObligation
        ? null
        : (paymentData as UpcomingPayment).paymentAmount;

    final label = goldObligation
        ? context.localization.obligationsGoldLoan
        : context.localization.obligationsOtherLoans;

    final subLabel = isExpired
        ? context.localization.obligationsUpcomingPaymentsPass
        : context.localization.obligationsUpcomingPaymentsPayment;

    final dayLabel = isExpired
        ? context.localization.day
        : context.localization.days;

    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 12.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
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
            iconPath: goldObligation
                ? SvgAssets.goldObligations
                : SvgAssets.otherObligations,
            width: 40.0,
            height: 32.0,
            iconSize: 32.0,
            padding: EdgeInsets.zero,
            backgroundColor: context.skapiColors.primaryLight,
          ),
          UpcomingPaymentLabelPayDay(
            label: label,
            subLabel: subLabel,
            days: '$remainingDays $dayLabel',
            spaceBetweenLabels: 0,
            labelStyle: context.skapiTextStyles.h5.copyWith(
              color: context.skapiColors.black,
            ),
            subLabelStyle: context.skapiTextStyles.tinyText.copyWith(
              fontSize: 12,
              height: 18 / 12,
              color: context.skapiColors.grayDark,
            ),
            hasPassed: isExpired,
          ),
          if (amount != null)
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
    );
  }
}
