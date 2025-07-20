import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';
import '../../constants/svg_assets.dart';

class ExpandableArrowIcon extends StatelessWidget {
  const ExpandableArrowIcon({required this.expanded, super.key});

  final bool expanded;

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      turns: expanded ? 0.0 : 0.5,
      duration: const Duration(milliseconds: 200),
      child: SvgPicture.asset(
        SvgAssets.arrowUp,
        colorFilter: ColorFilter.mode(
          expanded
              ? context.skapiColors.primary
              : context.skapiColors.grayMedium,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
