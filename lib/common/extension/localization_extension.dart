import 'package:flutter/material.dart';
import 'package:skapi_obligations/l10n/app_localizations/app_localizations.dart';

extension ThemeExtension on BuildContext {
  AppLocalizations get localization => AppLocalizations.of(this)!;
}
