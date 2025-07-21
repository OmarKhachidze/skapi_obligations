import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:skapi_obligations/common/theme/text_style/app_text_styles.dart';
import 'package:skapi_obligations/router/router.dart';

import 'common/theme/colors/app_colors.dart';
import 'common/utils/network_client/dio_handler.dart';
import 'l10n/app_localizations/app_localizations.dart';

void main() {
  DioHandler.setupDio();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        const seedColor = Color.fromRGBO(217, 35, 41, 1);

        final lightColorScheme =
            lightDynamic?.harmonized() ??
            ColorScheme.fromSeed(seedColor: seedColor);
        final darkColorScheme =
            darkDynamic?.harmonized() ??
            ColorScheme.fromSeed(
              seedColor: seedColor,
              brightness: Brightness.dark,
            );
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routeInformationProvider: MainRouter.router.routeInformationProvider,
          routeInformationParser: MainRouter.router.routeInformationParser,
          routerDelegate: MainRouter.router.routerDelegate,
          locale: AppLocalizations.supportedLocales.last,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: ThemeData(
            colorScheme: lightColorScheme,
            extensions: [lightSkapiColors, skapiTextStyles],
          ),
          darkTheme: ThemeData(
            colorScheme: darkColorScheme,
            extensions: [darkSkapiColors, skapiTextStyles],
          ),
        );
      },
    );
  }
}
