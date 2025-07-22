import 'package:flutter/material.dart';
import 'expandable_header.dart';

class SkapiExpandable extends StatelessWidget {
  const SkapiExpandable({
    super.key,
    required this.child,
    required this.iconPath,
    required this.label,
    required this.subLabel,
    required this.days,
    required this.amount,
    required this.isExpanded,
    required this.onToggle,
  });

  final Widget child;
  final String iconPath;
  final String label;
  final String subLabel;
  final String days;
  final double amount;
  final bool isExpanded;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onToggle,
          child: ExpandableHeader(
            expanded: isExpanded,
            iconPath: iconPath,
            label: label,
            subLabel: subLabel,
            days: days,
            amount: amount,
          ),
        ),
        AnimatedCrossFade(
          firstChild: const SizedBox.shrink(),
          secondChild: child,
          crossFadeState:
              isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 250),
        ),
      ],
    );
  }
}
