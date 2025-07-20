import 'package:flutter/material.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';
import 'package:skapi_obligations/features/obligations/presentation/widgets/upcoming_payment_section/upcoming_payment_pay_day_text.dart';

class UpcomingPaymentLabelPayDay extends StatelessWidget {
  const UpcomingPaymentLabelPayDay({
    super.key,
    required this.label,
    required this.days,
    required this.hasPassed,
  });

  final String label;
  final String days;
  final bool hasPassed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 2,
        children: [
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.skapiTextStyles.tinyText.copyWith(
              fontWeight: FontWeight.w500,
              color: context.skapiColors.black,
            ),
          ),
          UpcomingPaymentPayDayText(days: days, hasPassed: hasPassed),
        ],
      ),
    );
  }
}
