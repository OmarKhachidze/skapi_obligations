import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skapi_obligations/features/obligations/presentation/widgets/payment_info_section/payment_info_text.dart';

import '../../../../../common/constants/svg_assets.dart';

class PaymentInfoTextSection extends StatelessWidget {
  const PaymentInfoTextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          SvgPicture.asset(SvgAssets.errorOutline),
          const Expanded(child: PaymentInfoText()),
        ],
      ),
    );
  }
}
