import 'package:flutter/material.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';

class SkapiButton extends StatelessWidget {
  const SkapiButton({
    required this.label,
    required this.onPress,
    this.buttonNotifier,
    super.key,
  });

  final String label;
  final VoidCallback onPress;
  final ValueNotifier<bool>? buttonNotifier;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 44,
      child: ValueListenableBuilder(
        valueListenable: buttonNotifier ?? ValueNotifier(true),
        builder: (context, enabled, _) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              disabledBackgroundColor: context.skapiColors.primary.withValues(
                alpha: 0.48,
              ),
              backgroundColor: context.skapiColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: enabled ? onPress : null,
            child: Text(
              label,
              style: context.skapiTextStyles.buttonPrimary.copyWith(
                fontFeatures: [const FontFeature.caseSensitiveForms()],
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
