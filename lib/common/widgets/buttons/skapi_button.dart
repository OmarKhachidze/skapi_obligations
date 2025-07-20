import 'package:flutter/material.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';

class SkapiButton extends StatelessWidget {
  const SkapiButton({required this.label, required this.onPress, super.key});

  final String label;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 44,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: context.skapiColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPress,
        child: Text(
          label,
          style: context.skapiTextStyles.buttonPrimary.copyWith(
            fontFeatures: [const FontFeature.caseSensitiveForms()],
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
