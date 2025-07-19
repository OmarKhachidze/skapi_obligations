import 'package:flutter/material.dart';
import 'package:skapi_obligations/common/theme/skapi_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Home Screen',
          style: TextStyle(
            color: Theme.of(context).extension<SkapiColors>()!.black,
          ),
        ),
      ),
    );
  }
}
