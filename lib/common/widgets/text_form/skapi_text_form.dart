import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';

import '../../constants/svg_assets.dart';

class SkapiTextForm extends StatelessWidget {
  const SkapiTextForm({
    super.key,
    required this.textEditingController,
    this.enabled = true,
  });

  final TextEditingController textEditingController;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      enabled: enabled,
      style: context.skapiTextStyles.h3.copyWith(
        color: context.skapiColors.black,
      ),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
      ],
      cursorColor: context.skapiColors.black,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 14.0,
        ),
        filled: true,
        fillColor: context.skapiColors.grayVeryLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(color: context.skapiColors.grayLight),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(color: context.skapiColors.grayLight),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(color: context.skapiColors.grayLight),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: context.skapiColors.grayLight,
          ), // same as enabled
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: SvgPicture.asset(
            SvgAssets.gelSymbol,
            colorFilter: ColorFilter.mode(
              context.skapiColors.grayMedium,
              BlendMode.srcIn,
            ),
          ),
        ),
        suffixIconConstraints: const BoxConstraints(
          minWidth: 24,
          minHeight: 24,
        ),
      ),
      textAlign: TextAlign.left,
    );
  }
}
