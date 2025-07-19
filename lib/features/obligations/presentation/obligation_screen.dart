import 'package:flutter/material.dart';

import '../../../common/widgets/appbars/home_appbar.dart';

class ObligationScreen extends StatelessWidget {
  const ObligationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        onMenuPress: () {},
        onHelpPress: () {},
        onNotificationPress: () {},
      ),
    );
  }
}
