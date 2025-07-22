import 'package:flutter/material.dart';
import 'package:skapi_obligations/common/extension/localization_extension.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';
import 'package:skapi_obligations/common/widgets/text_form/skapi_text_form.dart';

class PayContent extends StatefulWidget {
  const PayContent({required this.amount, super.key});

  final double amount;

  @override
  State<PayContent> createState() => _PayContentState();
}

class _PayContentState extends State<PayContent> {
  final _textController = TextEditingController();

  @override
  void initState() {
    _textController.text = '${widget.amount}';
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Text(
          context.localization.paymentDetailsPayDescription,
          style: context.skapiTextStyles.tinyText.copyWith(
            fontSize: 12,
            height: 18 / 12,
            color: context.skapiColors.grayDark,
          ),
        ),
        SkapiTextForm(textEditingController: _textController, enabled: false),
      ],
    );
  }
}
