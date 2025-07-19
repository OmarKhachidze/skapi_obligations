import 'package:flutter/material.dart';
import 'package:skapi_obligations/common/theme/skapi_colors.dart';

extension ThemeExtension on BuildContext {
  SkapiColors get skapiTheme => Theme.of(this).extension<SkapiColors>()!;
}
