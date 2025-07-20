import 'package:flutter/material.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';
import 'package:skapi_obligations/features/obligations/presentation/widgets/upcoming_payment_section/upcoming_payment_pay_day_text.dart';

class UpcomingPaymentLabelPayDay extends StatelessWidget {
  const UpcomingPaymentLabelPayDay({
    super.key,
    required this.label,
    required this.subLabel,
    required this.days,
    required this.hasPassed,
    this.labelStyle,
    this.subLabelStyle,
    this.spaceBetweenLabels,
  });

  final String label;
  final String subLabel;
  final String days;
  final bool hasPassed;
  final TextStyle? labelStyle;
  final TextStyle? subLabelStyle;
  final double? spaceBetweenLabels;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: spaceBetweenLabels ?? 2,
        children: [
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style:
                labelStyle ??
                context.skapiTextStyles.tinyText.copyWith(
                  fontWeight: FontWeight.w500,
                  color: context.skapiColors.black,
                ),
          ),
          UpcomingPaymentPayDayText(
            label: subLabel,
            days: days,
            textStyle: subLabelStyle,
            hasPassed: hasPassed,
          ),
        ],
      ),
    );
  }
}
