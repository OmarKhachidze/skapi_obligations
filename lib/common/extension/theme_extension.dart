import 'package:flutter/material.dart';

import '../theme/colors/skapi_colors.dart';
import '../theme/text_style/skapi_text_styles.dart';

extension ThemeExtension on BuildContext {
  SkapiColors get skapiColors => Theme.of(this).extension<SkapiColors>()!;

  SkapiTextStyles get skapiTextStyles =>
      Theme.of(this).extension<SkapiTextStyles>()!;
}
