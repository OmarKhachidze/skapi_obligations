import 'package:flutter/material.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';

import '../../../common/widgets/appbars/home_appbar.dart';

class ObligationScreen extends StatelessWidget {
  const ObligationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.skapiColors.grayDark,
      appBar: HomeAppBar(
        onMenuPress: () {},
        onHelpPress: () {},
        onNotificationPress: () {},
      ),
    );
  }
}
