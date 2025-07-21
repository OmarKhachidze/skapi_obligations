import 'package:flutter/material.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';
import 'package:skapi_obligations/features/obligations/presentation/widgets/available_amount_section/available_amount_section.dart';
import 'package:skapi_obligations/features/obligations/presentation/widgets/my_obligations_section/my_obligations_section.dart';
import 'package:skapi_obligations/features/obligations/presentation/widgets/upcoming_payment_section/upcoming_payment_section.dart';

import '../../../common/widgets/appbars/home_appbar.dart';

class ObligationScreen extends StatelessWidget {
  const ObligationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.skapiColors.grayLight,
      appBar: HomeAppBar(
        onMenuPress: () async {},
        onHelpPress: () {},
        onNotificationPress: () {},
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: const [
          MyObligationsSection(amount: 12_131_580.00),
          AvailableAmountSection(amount: 10_558.29),
          UpcomingPaymentSection(),
        ],
      ),
    );
  }
}
