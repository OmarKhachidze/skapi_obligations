import 'package:flutter/material.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';
import 'package:skapi_obligations/common/widgets/buttons/skapi_button.dart';

class ScaffoldButton extends StatelessWidget {
  const ScaffoldButton({required this.label, required this.onPress, this.buttonNotifier, super.key});

  final String label;
  final VoidCallback onPress;
  final ValueNotifier<bool>? buttonNotifier;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      decoration: BoxDecoration(color: context.skapiColors.grayLight),
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
      child: SkapiButton(label: label, onPress: onPress, buttonNotifier: buttonNotifier,),
    );
  }
}
