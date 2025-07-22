import 'package:flutter/material.dart';
import 'package:skapi_obligations/common/extension/localization_extension.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';

class PaymentInfoText extends StatelessWidget {
  const PaymentInfoText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '${context.localization.paymentDetailsBeforePaymentInfoText}: ',
        style: context.skapiTextStyles.tinyText.copyWith(
          color: context.skapiColors.grayDark,
        ),
        children: [
          TextSpan(
            text: context.localization.paymentDetailsBeforePaymentInfoNumber,
            style: context.skapiTextStyles.tinyText.copyWith(
              fontWeight: FontWeight.w700,
              color: context.skapiColors.error,
            ),
          ),
        ],
      ),
    );
  }
}
