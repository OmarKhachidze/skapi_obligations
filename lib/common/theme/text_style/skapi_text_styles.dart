import 'package:flutter/material.dart';
@immutable
class SkapiTextStyles extends ThemeExtension<SkapiTextStyles> {
  const SkapiTextStyles({
    required this.h1,
    required this.h2,
    required this.h3,
    required this.h4,
    required this.h5,
    required this.bodyBig,
    required this.bodyMedium,
    required this.bodySmall,
    required this.buttonPrimary,
    required this.buttonSecondary,
    required this.tinyText,
    required this.gel,
  });

  final TextStyle h1;
  final TextStyle h2;
  final TextStyle h3;
  final TextStyle h4;
  final TextStyle h5;
  final TextStyle bodyBig;
  final TextStyle bodyMedium;
  final TextStyle bodySmall;
  final TextStyle buttonPrimary;
  final TextStyle buttonSecondary;
  final TextStyle tinyText;
  final TextStyle gel;

  @override
  SkapiTextStyles copyWith({
    TextStyle? h1,
    TextStyle? h2,
    TextStyle? h3,
    TextStyle? h4,
    TextStyle? h5,
    TextStyle? bodyBig,
    TextStyle? bodyMedium,
    TextStyle? bodySmall,
    TextStyle? buttonPrimary,
    TextStyle? buttonSecondary,
    TextStyle? tinyText,
    TextStyle? gel,
  }) {
    return SkapiTextStyles(
      h1: h1 ?? this.h1,
      h2: h2 ?? this.h2,
      h3: h3 ?? this.h3,
      h4: h4 ?? this.h4,
      h5: h5 ?? this.h5,
      bodyBig: bodyBig ?? this.bodyBig,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      bodySmall: bodySmall ?? this.bodySmall,
      buttonPrimary: buttonPrimary ?? this.buttonPrimary,
      buttonSecondary: buttonSecondary ?? this.buttonSecondary,
      tinyText: tinyText ?? this.tinyText,
      gel: gel ?? this.gel,
    );
  }

  @override
  SkapiTextStyles lerp(ThemeExtension<SkapiTextStyles>? other, double t) {
    if (other is! SkapiTextStyles) return this;
    return SkapiTextStyles(
      h1: TextStyle.lerp(h1, other.h1, t) ?? h1,
      h2: TextStyle.lerp(h2, other.h2, t) ?? h2,
      h3: TextStyle.lerp(h3, other.h3, t) ?? h3,
      h4: TextStyle.lerp(h4, other.h4, t) ?? h4,
      h5: TextStyle.lerp(h5, other.h5, t) ?? h5,
      bodyBig: TextStyle.lerp(bodyBig, other.bodyBig, t) ?? bodyBig,
      bodyMedium: TextStyle.lerp(bodyMedium, other.bodyMedium, t) ?? bodyMedium,
      bodySmall: TextStyle.lerp(bodySmall, other.bodySmall, t) ?? bodySmall,
      buttonPrimary: TextStyle.lerp(buttonPrimary, other.buttonPrimary, t) ?? buttonPrimary,
      buttonSecondary: TextStyle.lerp(buttonSecondary, other.buttonSecondary, t) ?? buttonSecondary,
      tinyText: TextStyle.lerp(tinyText, other.tinyText, t) ?? tinyText,
      gel: TextStyle.lerp(gel, other.gel, t) ?? gel,
    );
  }

  SkapiTextStyles harmonized(TextStyle dynamicTextStyle) {
    return copyWith(
      h1: h1.copyWith(),
      h2: h2.copyWith(),
      h3: h3.copyWith(),
      h4: h4.copyWith(),
      h5: h5.copyWith(),
      bodyBig: bodyBig.copyWith(),
      bodyMedium: bodyMedium.copyWith(),
      bodySmall: bodySmall.copyWith(),
      buttonPrimary: buttonPrimary.copyWith(),
      buttonSecondary: buttonSecondary.copyWith(),
      tinyText: tinyText.copyWith(),
      gel: gel.copyWith(),
    );
  }
}