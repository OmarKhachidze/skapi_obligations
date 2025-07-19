import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

@immutable
class SkapiColors extends ThemeExtension<SkapiColors> {
  const SkapiColors({
    this.black,
    this.white,
    this.grayMedium,
    this.grayDark,
    this.grayLight,
    this.grayVeryLight,
    this.primary,
    this.primaryDark,
    this.primaryLight,
    this.success,
    this.successLight,
    this.warning,
    this.warningLight,
    this.error,
    this.errorLight,
  });

  final Color? black;
  final Color? white;
  final Color? grayMedium;
  final Color? grayDark;
  final Color? grayLight;
  final Color? grayVeryLight;
  final Color? primary;
  final Color? primaryDark;
  final Color? primaryLight;
  final Color? success;
  final Color? successLight;
  final Color? warning;
  final Color? warningLight;
  final Color? error;
  final Color? errorLight;

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
    Color? danger,
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
      black: Color.lerp(black, other.black, t),
      white: Color.lerp(white, other.white, t),
      grayMedium: Color.lerp(grayMedium, other.grayMedium, t),
      grayDark: Color.lerp(grayDark, other.grayDark, t),
      grayLight: Color.lerp(grayLight, other.grayLight, t),
      grayVeryLight: Color.lerp(grayVeryLight, other.grayVeryLight, t),
      primary: Color.lerp(primary, other.primary, t),
      primaryDark: Color.lerp(primaryDark, other.primaryDark, t),
      primaryLight: Color.lerp(primaryLight, other.primaryLight, t),
      success: Color.lerp(success, other.success, t),
      successLight: Color.lerp(successLight, other.successLight, t),
      warning: Color.lerp(warning, other.warning, t),
      warningLight: Color.lerp(warningLight, other.warningLight, t),
      error: Color.lerp(error, other.error, t),
      errorLight: Color.lerp(errorLight, other.errorLight, t),
    );
  }

  SkapiColors harmonized(ColorScheme dynamicScheme) {
    return copyWith(
      black: black?.harmonizeWith(dynamicScheme.primary),
      white: white?.harmonizeWith(dynamicScheme.primary),
      grayMedium: grayMedium?.harmonizeWith(dynamicScheme.primary),
      grayDark: grayDark?.harmonizeWith(dynamicScheme.primary),
      grayLight: grayLight?.harmonizeWith(dynamicScheme.primary),
      grayVeryLight: grayVeryLight?.harmonizeWith(dynamicScheme.primary),
      primary: primary?.harmonizeWith(dynamicScheme.primary),
      primaryDark: primaryDark?.harmonizeWith(dynamicScheme.primary),
      primaryLight: primaryLight?.harmonizeWith(dynamicScheme.primary),
      success: success?.harmonizeWith(dynamicScheme.primary),
      successLight: successLight?.harmonizeWith(dynamicScheme.primary),
      warning: warning?.harmonizeWith(dynamicScheme.primary),
      warningLight: warningLight?.harmonizeWith(dynamicScheme.primary),
      error: error?.harmonizeWith(dynamicScheme.primary),
      errorLight: errorLight?.harmonizeWith(dynamicScheme.primary),
    );
  }
}
