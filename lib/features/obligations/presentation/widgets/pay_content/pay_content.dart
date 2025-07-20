import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skapi_obligations/common/extension/localization_extension.dart';
import 'package:skapi_obligations/common/extension/number_extension.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';

import '../../../../../common/constants/svg_assets.dart';

class PayContent extends StatelessWidget {
  const PayContent({required this.amount, super.key});

  final double amount;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Text(
          context.localization.paymentDetailsPayDescription,
          style: context.skapiTextStyles.tinyText.copyWith(
            fontSize: 12,
            height: 18 / 12,
            color: context.skapiColors.grayDark,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
          decoration: BoxDecoration(
            color: context.skapiColors.grayVeryLight,
            borderRadius: BorderRadius.circular(6.0),
            border: Border.all(color: context.skapiColors.grayLight),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 10,
            children: [
              Text(
                amount.formatToString(),
                style: context.skapiTextStyles.h3.copyWith(
                  color: context.skapiColors.black,
                ),
              ),
              SvgPicture.asset(
                SvgAssets.gelSymbol,
                colorFilter: ColorFilter.mode(
                  context.skapiColors.grayMedium,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
