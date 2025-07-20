import 'package:flutter/material.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';

class UpcomingPaymentPayDayText extends StatelessWidget {
  const UpcomingPaymentPayDayText({
    required this.label,
    required this.days,
    required this.hasPassed,
    this.textStyle,
    super.key,
  });

  final String label;
  final String days;
  final bool hasPassed;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: label,
        style:
            textStyle ??
            context.skapiTextStyles.tinyText.copyWith(
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
            style:
                textStyle?.copyWith(fontWeight: FontWeight.w700) ??
                context.skapiTextStyles.tinyText.copyWith(
                  fontWeight: FontWeight.w700,
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
