import 'package:flutter/material.dart';
import 'package:skapi_obligations/features/obligations/presentation/widgets/before_payment_section/before_payment_payment_amount.dart';

import 'before_payment_description.dart';

class BeforePaymentSection extends StatelessWidget {
  const BeforePaymentSection({super.key, required this.paymentData});

  final dynamic paymentData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BeforePaymentDescription(),
        BeforePaymentPaymentAmount(paymentData: paymentData),
      ],
    );
  }
}
