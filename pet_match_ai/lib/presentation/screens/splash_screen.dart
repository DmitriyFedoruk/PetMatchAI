import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pet_match_ai/core/const/strings.dart';
import 'package:pet_match_ai/core/navigation/router.dart';
import 'package:pet_match_ai/core/navigation/routes/route_path.dart';
import 'package:pet_match_ai/core/theme/extensions/app_typography_extension.dart';
import 'package:pet_match_ai/core/ui/language_notifier.dart';
import 'package:pet_match_ai/core/ui/loader.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 4), (timer) {
      timer.cancel();
      router.go(RoutePaths.introScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    final typography = context.typography;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppStrings.title, style: typography.title),
                  LanguageSwitch(),
                ],
              ),
              const Loader(),
              const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
