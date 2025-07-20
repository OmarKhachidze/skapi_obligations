import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';
import '../../../../../common/constants/svg_assets.dart';

class UpcomingPaymentErrorIcon extends StatelessWidget {
  const UpcomingPaymentErrorIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18.0,
      height: 18.0,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: context.skapiColors.error,
        shape: BoxShape.circle,
        border: Border.all(color: context.skapiColors.white, width: 3),
      ),
      child: SvgPicture.asset(
        SvgAssets.exclamationMark,
        colorFilter: ColorFilter.mode(
          context.skapiColors.white,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
