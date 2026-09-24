
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'core/localization/locale_provider.dart';
import 'features/food/presentation/providers/food_provider.dart';
import 'features/home/presentation/screens/home_screen.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        // ============================================================
        // LANGUAGE PROVIDER
        // ============================================================
        ChangeNotifierProvider(
          create: (_) => LocaleProvider(),
        ),

        // ============================================================
        // FOOD PROVIDER
        // ============================================================
        ChangeNotifierProvider(
          create: (_) => FoodProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(
      builder: (context, localeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,

          title: 'WINGA KIGANJANI',

          // ==========================================================
          // THEME
          // ==========================================================
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue,
            ),
          ),

          // ==========================================================
          // LOCALIZATION
          // ==========================================================
          locale: localeProvider.locale,

          supportedLocales: const [
            Locale('sw'),
            Locale('en'),
          ],

          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],

          // ==========================================================
          // MAIN SCREEN
          // ==========================================================
          home: HomeScreen(
            isLoggedIn: false,
          ),
        );
      },
    );
  }
}

