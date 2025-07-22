import 'package:flutter/material.dart';
import 'package:skapi_obligations/common/extension/date_formatter_extension.dart';
import 'package:skapi_obligations/common/extension/localization_extension.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';
import 'package:skapi_obligations/features/obligations/domain/models/common_obligation/upcoming_payment.dart';
import 'package:skapi_obligations/features/obligations/domain/models/common_obligation/upcoming_payment_item.dart';

import '../../../../../common/constants/svg_assets.dart';
import '../../../../../common/widgets/expandable/skapi_expandable.dart';
import '../payment_loans/skapi_expandable_content.dart';

class LoansDetailsSection extends StatefulWidget {
  const LoansDetailsSection({
    super.key,
    required this.upcomingPayment,
    required this.onItemChange,
  });

  final UpcomingPayment upcomingPayment;
  final ValueChanged<UpcomingPaymentItem> onItemChange;

  @override
  State<LoansDetailsSection> createState() => _LoansDetailsSectionState();
}

class _LoansDetailsSectionState extends State<LoansDetailsSection> {
  int _expandedIndex = 0;

  void _toggleExpansion(int index) {
    if (index == _expandedIndex) return;
    setState(() {
      _expandedIndex = index;
    });
    widget.onItemChange(widget.upcomingPayment.items[_expandedIndex]);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
          color: context.skapiColors.white,
        ),
        child: ListView.builder(
          itemCount: widget.upcomingPayment.items.length,
          itemBuilder: (context, index) {
            final e = widget.upcomingPayment.items[index];
            return SkapiExpandable(
              iconPath: SvgAssets.otherObligations,
              label: context.localization.obligationsOtherLoans,
              subLabel: e.paymentDate.toFormattedDate(),
              amount: e.paymentAmount,
              days: '',
              isExpanded: _expandedIndex == index,
              onToggle: () => _toggleExpansion(index),
              child: SkapiExpandableContent(upcomingPayment: e),
            );
          },
        ),
      ),
    );
  }
}
