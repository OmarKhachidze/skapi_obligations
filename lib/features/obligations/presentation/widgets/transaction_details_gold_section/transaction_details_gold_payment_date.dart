import 'package:flutter/material.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';

class TransactionDetailsGoldPaymentDate extends StatelessWidget {
  const TransactionDetailsGoldPaymentDate({
    super.key,
    required this.label,
    required this.date,
  });

  final String label;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 6,
          children: [
            Expanded(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.skapiTextStyles.bodySmall.copyWith(
                  color: context.skapiColors.grayDark,
                ),
              ),
            ),
            Text(
              date,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.skapiTextStyles.bodyMedium.copyWith(
                color: context.skapiColors.black,
              ),
            ),
          ],
        ),
        Divider(height: 1, thickness: 1, color: context.skapiColors.grayLight),
      ],
    );
  }
}
