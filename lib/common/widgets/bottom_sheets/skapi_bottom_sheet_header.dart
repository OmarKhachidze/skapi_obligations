import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';

import '../../constants/svg_assets.dart';

class SkapiBottomSheetHeader extends StatelessWidget {
  const SkapiBottomSheetHeader({
    super.key,
    required this.label,
    required this.onClosePress,
  });

  final String label;
  final VoidCallback onClosePress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            top: 16.0,
            right: 20.0,
            bottom: 12.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 12,
            children: [
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.skapiTextStyles.h3.copyWith(
                  color: context.skapiColors.black,
                ),
              ),
              InkWell(
                onTap: onClosePress,
                child: SvgPicture.asset(
                  SvgAssets.close,
                  colorFilter: ColorFilter.mode(
                    context.skapiColors.grayDark,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(height: 1, thickness: 1, color: context.skapiColors.grayLight),
      ],
    );
  }
}
