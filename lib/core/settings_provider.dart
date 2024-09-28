import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  String currentLanguage = "en";
  ThemeMode currentTheme = ThemeMode.light;

  changeCurrentLanguage(String newLanguage) {
    if (currentLanguage == newLanguage) return;
    currentLanguage = newLanguage;
    notifyListeners();
  }

  changeCurrentTheme(ThemeMode newTheme) {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    notifyListeners();
  }

  String getBackgroundImage() {
    return (currentTheme == ThemeMode.dark
        ? "assets/images/dark_bg.png"
        : "assets/images/light_bg.png");
  }

  String getSplashImage() {
    return (currentTheme == ThemeMode.dark
        ? "assets/images/dark_splash.png"
        : "assets/images/light_splash.png");
  }

  bool isDark() {
    return (currentTheme == ThemeMode.dark);
  }

  bool isArabic() {
    return (currentLanguage == "en");
  }
}
