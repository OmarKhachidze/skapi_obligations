import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

@immutable
class SkapiColors extends ThemeExtension<SkapiColors> {
  const SkapiColors({
    required this.black,
    required this.white,
    required this.grayMedium,
    required this.grayDark,
    required this.grayLight,
    required this.grayVeryLight,
    required this.primary,
    required this.primaryDark,
    required this.primaryLight,
    required this.success,
    required this.successLight,
    required this.warning,
    required this.warningLight,
    required this.error,
    required this.errorLight,
  });

  final Color black;
  final Color white;
  final Color grayMedium;
  final Color grayDark;
  final Color grayLight;
  final Color grayVeryLight;
  final Color primary;
  final Color primaryDark;
  final Color primaryLight;
  final Color success;
  final Color successLight;
  final Color warning;
  final Color warningLight;
  final Color error;
  final Color errorLight;

  @override
  SkapiColors copyWith({
    Color? black,
    Color? white,
    Color? grayMedium,
    Color? grayDark,
    Color? grayLight,
    Color? grayVeryLight,
    Color? primary,
    Color? primaryDark,
    Color? primaryLight,
    Color? success,
    Color? successLight,
    Color? warning,
    Color? warningLight,
    Color? error,
    Color? errorLight,
  }) {
    return SkapiColors(
      black: black ?? this.black,
      white: white ?? this.white,
      grayMedium: grayMedium ?? this.grayMedium,
      grayDark: grayDark ?? this.grayDark,
      grayLight: grayLight ?? this.grayLight,
      grayVeryLight: grayVeryLight ?? this.grayVeryLight,
      primary: primary ?? this.primary,
      primaryDark: primaryDark ?? this.primaryDark,
      primaryLight: primaryLight ?? this.primaryLight,
      success: success ?? this.success,
      successLight: successLight ?? this.successLight,
      warning: warning ?? this.warning,
      warningLight: warningLight ?? this.warningLight,
      error: error ?? this.error,
      errorLight: errorLight ?? this.errorLight,
    );
  }

  @override
  SkapiColors lerp(ThemeExtension<SkapiColors>? other, double t) {
    if (other is! SkapiColors) return this;
    return SkapiColors(
      black: Color.lerp(black, other.black, t) ?? black,
      white: Color.lerp(white, other.white, t) ?? white,
      grayMedium: Color.lerp(grayMedium, other.grayMedium, t) ?? grayMedium,
      grayDark: Color.lerp(grayDark, other.grayDark, t) ?? grayDark,
      grayLight: Color.lerp(grayLight, other.grayLight, t) ?? grayLight,
      grayVeryLight: Color.lerp(grayVeryLight, other.grayVeryLight, t) ?? grayVeryLight,
      primary: Color.lerp(primary, other.primary, t) ?? primary,
      primaryDark: Color.lerp(primaryDark, other.primaryDark, t) ?? primaryDark,
      primaryLight: Color.lerp(primaryLight, other.primaryLight, t) ?? primaryLight,
      success: Color.lerp(success, other.success, t) ?? success,
      successLight: Color.lerp(successLight, other.successLight, t) ?? successLight,
      warning: Color.lerp(warning, other.warning, t) ?? warning,
      warningLight: Color.lerp(warningLight, other.warningLight, t) ?? warningLight,
      error: Color.lerp(error, other.error, t) ?? error,
      errorLight: Color.lerp(errorLight, other.errorLight, t) ?? errorLight,
    );
  }

  SkapiColors harmonized(ColorScheme dynamicScheme) {
    return copyWith(
      black: black.harmonizeWith(dynamicScheme.primary),
      white: white.harmonizeWith(dynamicScheme.primary),
      grayMedium: grayMedium.harmonizeWith(dynamicScheme.primary),
      grayDark: grayDark.harmonizeWith(dynamicScheme.primary),
      grayLight: grayLight.harmonizeWith(dynamicScheme.primary),
      grayVeryLight: grayVeryLight.harmonizeWith(dynamicScheme.primary),
      primary: primary.harmonizeWith(dynamicScheme.primary),
      primaryDark: primaryDark.harmonizeWith(dynamicScheme.primary),
      primaryLight: primaryLight.harmonizeWith(dynamicScheme.primary),
      success: success.harmonizeWith(dynamicScheme.primary),
      successLight: successLight.harmonizeWith(dynamicScheme.primary),
      warning: warning.harmonizeWith(dynamicScheme.primary),
      warningLight: warningLight.harmonizeWith(dynamicScheme.primary),
      error: error.harmonizeWith(dynamicScheme.primary),
      errorLight: errorLight.harmonizeWith(dynamicScheme.primary),
    );
  }
}
