import 'package:flutter/material.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';

class EmptyScreen extends StatefulWidget {
  const EmptyScreen({required this.title, super.key});

  final String title;

  @override
  State<EmptyScreen> createState() => _EmptyScreenState();
}

class _EmptyScreenState extends State<EmptyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          widget.title,
          style: context.skapiTextStyles.bodyMedium,
        ),
      ),
    );
  }
}
