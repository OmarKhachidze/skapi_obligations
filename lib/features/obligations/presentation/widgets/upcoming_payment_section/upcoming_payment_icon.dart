import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';
import 'package:skapi_obligations/features/obligations/presentation/widgets/upcoming_payment_section/upcoming_payment_error_icon.dart';

class UpcomingPaymentIcon extends StatelessWidget {
  const UpcomingPaymentIcon({
    required this.iconPath,
    this.hasPassed = false,
    super.key,
  });

  final String iconPath;
  final bool hasPassed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 44.0,
          width: 48.0,
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
          decoration: BoxDecoration(
            color: context.skapiColors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: SizedBox(
            width: 36.0,
            height: 36.0,
            child: SvgPicture.asset(iconPath),
          ),
        ),
        hasPassed
            ? const Positioned(
                top: -5,
                right: -5,
                child: UpcomingPaymentErrorIcon(),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
