import 'package:flutter/material.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';

class SkapiRadioButtonLabels extends StatelessWidget {
  const SkapiRadioButtonLabels({
    super.key,
    required this.label,
    required this.subLabel,
    this.hasPassed = false,
  });

  final String label;
  final String subLabel;
  final bool hasPassed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 2,
        children: [
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.skapiTextStyles.h4.copyWith(
              color: context.skapiColors.black,
            ),
          ),
          Text(
            subLabel,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.skapiTextStyles.tinyText.copyWith(
              fontSize: 12,
              height: 18 / 12,
              color: hasPassed
                  ? context.skapiColors.error
                  : context.skapiColors.grayDark,
            ),
          ),
        ],
      ),
    );
  }
}
