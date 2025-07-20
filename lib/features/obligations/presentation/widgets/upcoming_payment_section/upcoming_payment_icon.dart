import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';
import 'package:skapi_obligations/features/obligations/presentation/widgets/upcoming_payment_section/upcoming_payment_error_icon.dart';

class UpcomingPaymentIcon extends StatelessWidget {
  const UpcomingPaymentIcon({
    required this.iconPath,
    this.hasPassed = false,
    this.width,
    this.height,
    this.iconSize,
    this.backgroundColor,
    this.padding,
    super.key,
  });

  final String iconPath;
  final bool hasPassed;
  final double? width;
  final double? height;
  final double? iconSize;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: height ?? 44.0,
          width: width ?? 48.0,
          padding:
              padding ??
              const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
          decoration: BoxDecoration(
            color: backgroundColor ?? context.skapiColors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: SizedBox(
            width: iconSize ?? 36.0,
            height: iconSize ?? 36.0,
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
