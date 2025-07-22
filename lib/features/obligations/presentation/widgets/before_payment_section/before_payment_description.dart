import 'package:flutter/material.dart';
import 'package:skapi_obligations/common/extension/localization_extension.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';

import '../../../../../common/constants/app_constants.dart';

class BeforePaymentDescription extends StatelessWidget {
  const BeforePaymentDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: context.skapiColors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 4,
        children: [
          Text(
            context.localization.paymentDetailsBeforePayment,
            overflow: TextOverflow.ellipsis,
            style: context.skapiTextStyles.h3.copyWith(
              fontFamily: notoSans,
              fontFeatures: [const FontFeature.caseSensitiveForms()],
              fontVariations: [const FontVariation('wght', 500)],
              color: context.skapiColors.black,
            ),
          ),
          Text(
            context.localization.paymentDetailsBeforePaymentDescription,
            style: context.skapiTextStyles.bodySmall.copyWith(
              color: context.skapiColors.grayDark,
            ),
          ),
        ],
      ),
    );
  }
}
