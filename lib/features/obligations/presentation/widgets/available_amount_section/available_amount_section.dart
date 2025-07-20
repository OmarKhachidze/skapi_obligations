import 'package:flutter/material.dart';
import 'package:skapi_obligations/common/extension/localization_extension.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';

import 'available_amount.dart';

class AvailableAmountSection extends StatelessWidget {
  const AvailableAmountSection({required this.amount, super.key});

  final double amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: context.skapiColors.grayVeryLight,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        spacing: 6,
        children: [
          AvailableAmount(amount: amount),
          Text(
            context.localization.obligationsAvailableAmountDescription,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: context.skapiTextStyles.tinyText.copyWith(
              fontSize: 11,
              height: 16 / 11,
              color: context.skapiColors.grayDark,
            ),
          ),
        ],
      ),
    );
  }
}
