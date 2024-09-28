import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami_app/core/settings_provider.dart';
import 'package:islami_app/layout/layout_view.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  static const String routeName = "/";

  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Layoutview.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Scaffold(
      body: Center(
        child: Image.asset(
          provider.getSplashImage(),
          fit: BoxFit.fill,
          width: double.infinity,
        ),
      ),
    );
  }
}
