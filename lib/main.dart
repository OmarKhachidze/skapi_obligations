import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

import 'common/theme/app_colors.dart';
import 'home_screen.dart';

void main() {
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
        return MaterialApp(
          title: 'Skapi',
          theme: ThemeData(
            colorScheme: lightColorScheme,
            extensions: [lightSkapiColors],
          ),
          darkTheme: ThemeData(
            colorScheme: darkColorScheme,
            extensions: [darkSkapiColors],
          ),
          home: const HomeScreen(),
        );
      },
    );
  }
}
