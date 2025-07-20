import 'package:flutter/material.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';
import 'package:skapi_obligations/features/obligations/presentation/widgets/my_obligations.dart';

import '../../../common/widgets/appbars/home_appbar.dart';

class ObligationScreen extends StatelessWidget {
  const ObligationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.skapiColors.grayLight,
      appBar: HomeAppBar(
        onMenuPress: () {},
        onHelpPress: () {},
        onNotificationPress: () {},
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: const [MyObligations(amount: 12131580.00)],
      ),
    );
  }
}
