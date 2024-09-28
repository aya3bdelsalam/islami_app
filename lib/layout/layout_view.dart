import 'package:flutter/material.dart';
import 'package:islami_app/core/theme/application_theme_data.dart';
import 'package:provider/provider.dart';
import '../core/settings_provider.dart';
import '../modules/hadith/hadith.dart';
import '../modules/quran/quran.dart';
import '../modules/radio/radio.dart';
import '../modules/sebha/sebha.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../modules/settings/settings.dart';

class Layoutview extends StatefulWidget {
  static const String routeName = "layoutview";

  const Layoutview({super.key});

  @override
  State<Layoutview> createState() => _LayoutviewState();
}

class _LayoutviewState extends State<Layoutview> {
  int selectedIndex = 0;

  List<Widget> ScreensList = [
    const QuranView(),
    const HadithView(),
    const SebhaView(),
    const RadioView(),
    const SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    var lang = AppLocalizations.of(context)!;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(provider.getBackgroundImage()),
              fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            lang.islami,
          ),
          centerTitle: true,
        ),
        body: ScreensList[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage("assets/icons/quran_icn.png")),
                label: lang.quran),
            BottomNavigationBarItem(
                icon:
                    const ImageIcon(AssetImage("assets/icons/hadith_icn.png")),
                label: lang.hadith),
            BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage("assets/icons/sebha_icn.png")),
                label: lang.tasbeh),
            BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage("assets/icons/radio_icn.png")),
                label: lang.radio),
            BottomNavigationBarItem(
                icon: const Icon(Icons.settings), label: lang.sittings),
          ],
        ),
      ),
    );
  }
}
