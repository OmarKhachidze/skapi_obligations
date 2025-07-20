import 'package:flutter/material.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';
import 'package:skapi_obligations/features/obligations/presentation/widgets/payment_loans/skapi_expandable_item.dart';

class SkapiExpandableContent extends StatelessWidget {
  const SkapiExpandableContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: context.skapiColors.grayLight),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: const Column(
        spacing: 8,
        children: [
          SkapiExpandableItem(label: 'ძირი:', amount: 10_558.29),
          SkapiExpandableItem(label: 'პროცენტი:', amount: 10_558.29),
          SkapiExpandableItem(label: 'ჯარიმა:', amount: 10_558.29),
        ],
      ),
    );
  }
}
