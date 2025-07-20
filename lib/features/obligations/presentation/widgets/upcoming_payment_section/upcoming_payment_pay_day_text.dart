import 'package:flutter/material.dart';
import 'package:skapi_obligations/common/extension/localization_extension.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';

class UpcomingPaymentPayDayText extends StatelessWidget {
  const UpcomingPaymentPayDayText({
    required this.days,
    required this.hasPassed,
    super.key,
  });

  final String days;
  final bool hasPassed;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: hasPassed
            ? context.localization.obligationsUpcomingPaymentsPass
            : context.localization.obligationsUpcomingPaymentsPayment,
        style: context.skapiTextStyles.tinyText.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 11,
          height: 16 / 11,
          color: hasPassed
              ? context.skapiColors.error
              : context.skapiColors.grayDark,
        ),
        children: [
          TextSpan(
            text: ' $days',
            style: context.skapiTextStyles.tinyText.copyWith(
              fontWeight: FontWeight.w900,
              fontSize: 11,
              height: 16 / 11,
              color: hasPassed
                  ? context.skapiColors.error
                  : context.skapiColors.grayDark,
            ),
          ),
        ],
      ),
    );
  }
}
