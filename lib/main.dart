import 'package:flutter/material.dart';
import 'package:islami_app/core/theme/application_theme_data.dart';
import 'package:islami_app/layout/layout_view.dart';
import 'package:islami_app/modules/splash/splash_view.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'core/settings_provider.dart';
import 'modules/hadith/hadith_details_view.dart';
import 'modules/quran/sura_details_view.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => SettingsProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context); //singleton
    return MaterialApp(
      title: "Islami App",
      themeMode: provider.currentTheme,
      theme: ApplicationThemeManager.lightTheme,
      darkTheme: ApplicationThemeManager.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => const SplashView(),
        Layoutview.routeName: (context) => const Layoutview(),
        SuraDetailsView.routeName: (context) => const SuraDetailsView(),
        HadithDetailsView.routeName: (context) => const HadithDetailsView(),
      },
      locale: Locale(provider.currentLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
