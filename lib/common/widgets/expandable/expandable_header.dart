import 'package:flutter/material.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';
import 'package:skapi_obligations/common/widgets/expandable/expandable_arrow_icon.dart';

import 'expandable_title.dart';

class ExpandableHeader extends StatelessWidget {
  const ExpandableHeader({
    super.key,
    required this.expanded,
    required this.iconPath,
    required this.label,
    required this.subLabel,
    required this.days,
    required this.amount,
  });

  final bool expanded;
  final String iconPath;
  final String label;
  final String subLabel;
  final String days;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: context.skapiColors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
        border: !expanded
            ? Border(
                bottom: BorderSide(
                  color: context.skapiColors.grayLight,
                  width: 1,
                ),
              )
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 6,
        children: [
          Expanded(
            child: ExpandableTitle(
              iconPath: iconPath,
              label: label,
              subLabel: subLabel,
              days: days,
              amount: amount,
            ),
          ),
          ExpandableArrowIcon(expanded: expanded),
        ],
      ),
    );
  }
}
