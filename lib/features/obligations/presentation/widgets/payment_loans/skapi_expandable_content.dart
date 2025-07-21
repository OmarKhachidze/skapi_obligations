import 'package:flutter/material.dart';
import 'package:skapi_obligations/common/extension/localization_extension.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';
import 'package:skapi_obligations/features/obligations/presentation/widgets/payment_loans/skapi_expandable_item.dart';

class SkapiExpandableContent extends StatelessWidget {
  const SkapiExpandableContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: context.skapiColors.grayLight),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Column(
        spacing: 8,
        children: [
          SkapiExpandableItem(
            label: '${context.localization.paymentDetailsRoot}:',
            amount: 420.95,
          ),
          SkapiExpandableItem(
            label: '${context.localization.paymentDetailsPercent}:',
            amount: 74.29,
          ),
          SkapiExpandableItem(
            label: '${context.localization.paymentDetailsFine}:',
            amount: 45.29,
          ),
        ],
      ),
    );
  }
}
