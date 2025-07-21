import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';
import 'package:skapi_obligations/common/widgets/bottom_sheets/skapi_bottom_sheet_header.dart';
import 'package:skapi_obligations/common/widgets/buttons/scaffold_button.dart';

class DefaultBottomSheet extends StatelessWidget {
  const DefaultBottomSheet({
    super.key,
    required this.children,
    required this.label,
    required this.buttonLabel,
    required this.onPress,
    this.buttonNotifier,
    this.whenComplete,
  });

  final Widget children;
  final String label;
  final String buttonLabel;
  final VoidCallback onPress;
  final ValueNotifier<bool>? buttonNotifier;
  final VoidCallback? whenComplete;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.skapiColors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          SkapiBottomSheetHeader(
            label: label,
            onClosePress: () {
              context.pop();
            },
          ),
          Padding(padding: const EdgeInsets.all(20.0), child: children),
          ScaffoldButton(
            label: buttonLabel,
            onPress: onPress,
            buttonNotifier: buttonNotifier,
          ),
        ],
      ),
    );
  }

  void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => this,
    ).whenComplete(() => whenComplete?.call());
  }
}
