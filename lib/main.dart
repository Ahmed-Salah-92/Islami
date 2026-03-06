import 'package:flutter/material.dart';

import 'core/resources/styles/app_theme.dart';
import 'core/utils/app_routes.dart';
import 'ui/home/home_screen.dart';
import 'ui/quranDetails/quran_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.darkTheme,
      themeMode: .dark,
      initialRoute: AppRoutes.homeRouteName,
      routes: {
        AppRoutes.homeRouteName: (_) => const HomeScreen(),
        AppRoutes.quranDetailsRouteName: (_) => const QuranDetailsScreen(),
      },
    );
  }
}
