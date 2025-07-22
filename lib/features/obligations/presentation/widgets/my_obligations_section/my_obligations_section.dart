import 'package:flutter/material.dart';
import 'package:skapi_obligations/common/constants/app_constants.dart';
import 'package:skapi_obligations/common/extension/localization_extension.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';

import '../../../../../common/widgets/money_text/money_text.dart';

class MyObligationsSection extends StatelessWidget {
  const MyObligationsSection({required this.amount, super.key});

  final double amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: context.skapiColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.localization.obligationsMyObligations,
            style: context.skapiTextStyles.h3.copyWith(
              fontFamily: notoSans,
              fontFeatures: [const FontFeature.caseSensitiveForms()],
              fontVariations: [const FontVariation('wght', 500)],
              color: context.skapiColors.grayDark,
            ),
          ),
          MoneyText(amount: amount),
        ],
      ),
    );
  }
}
