import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';

import '../../constants/app_constants.dart';

class SkapiIconButton extends StatelessWidget {
  const SkapiIconButton({
    required this.label,
    required this.iconPath,
    required this.onPress,
    this.loading = false,
    super.key,
  });

  final String label;
  final String iconPath;
  final VoidCallback onPress;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.skapiColors.primaryLight.withValues(
        alpha: !loading ? 1 : 0.48,
      ),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: !loading ? onPress : null,
        splashColor: context.skapiColors.primaryDark.withValues(alpha: 0.2),
        highlightColor: context.skapiColors.primaryDark.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 6,
            children: [
              SvgPicture.asset(
                iconPath,
                colorFilter: ColorFilter.mode(
                  context.skapiColors.primaryDark,
                  BlendMode.srcIn,
                ),
              ),
              Flexible(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.skapiTextStyles.buttonSecondary.copyWith(
                    fontFamily: notoSans,
                    fontFeatures: [const FontFeature.caseSensitiveForms()],
                    fontVariations: [const FontVariation('wght', 400)],
                    color: context.skapiColors.primaryDark,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
