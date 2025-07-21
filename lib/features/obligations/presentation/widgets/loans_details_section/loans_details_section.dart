import 'package:flutter/material.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';

import '../../../../../common/constants/svg_assets.dart';
import '../../../../../common/widgets/expandable/skapi_expandable.dart';
import '../payment_loans/skapi_expandable_content.dart';

class LoansDetailsSection extends StatelessWidget {
  const LoansDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
          color: context.skapiColors.white,
        ),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            SkapiExpandable(
              iconPath: SvgAssets.otherObligations,
              label: 'სხვა სესხები',
              subLabel: '07/07/2025',
              days: '',
              amount: 10_558.29,
              child: SkapiExpandableContent(),
            ),
            SkapiExpandable(
              iconPath: SvgAssets.otherObligations,
              label: 'სხვა სესხები',
              subLabel: '07/07/2025',
              days: '',
              amount: 10_558.29,
              child: SkapiExpandableContent(),
            ),
            SkapiExpandable(
              iconPath: SvgAssets.otherObligations,
              label: 'სხვა სესხები',
              subLabel: '07/07/2025',
              days: '',
              amount: 10_558.29,
              child: SkapiExpandableContent(),
            ),
            SkapiExpandable(
              iconPath: SvgAssets.otherObligations,
              label: 'სხვა სესხები',
              subLabel: '07/07/2025',
              days: '',
              amount: 10_558.29,
              child: SkapiExpandableContent(),
            ),
          ],
        ),
      ),
    );
  }
}
