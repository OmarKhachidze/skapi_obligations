import 'package:flutter/material.dart';
import 'package:skapi_obligations/common/extension/localization_extension.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';
import 'package:skapi_obligations/common/widgets/buttons/skapi_icon_button.dart';
import 'package:skapi_obligations/features/obligations/presentation/widgets/upcoming_payment_section/upcoming_payment_item.dart';

import '../../../../../common/constants/svg_assets.dart';

class UpcomingPaymentSection extends StatelessWidget {
  const UpcomingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: context.skapiColors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              context.localization.obligationsUpcomingPayments,
              style: context.skapiTextStyles.h3.copyWith(
                fontFeatures: [const FontFeature.caseSensitiveForms()],
                color: context.skapiColors.black,
              ),
            ),
          ),
          UpcomingPaymentItem(
            label: 'სხვა სესხები',
            iconPath: SvgAssets.otherObligations,
            days: '2 დღეში',
            amount: 10_558.29,
            onPress: () {},
          ),
          UpcomingPaymentItem(
            label: 'ოქროს ლომბარდი',
            iconPath: SvgAssets.goldObligations,
            days: '2 დღე',
            amount: 541.05,
            hasPassed: true,
            onPress: () {},
          ),
          Padding(
            padding: const EdgeInsetsGeometry.only(top: 4.0),
            child: SkapiIconButton(
              label: 'ამონაწერის მომზადება',
              iconPath: SvgAssets.listAlt,
              onPress: () {},
            ),
          ),
        ],
      ),
    );
  }
}
