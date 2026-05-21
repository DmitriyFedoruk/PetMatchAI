import 'package:flutter/material.dart';
import 'package:pet_match_ai/core/const/strings.dart';
import 'package:pet_match_ai/core/navigation/router.dart';
import 'package:pet_match_ai/core/navigation/routes/route_path.dart';
import 'package:pet_match_ai/core/theme/extensions/app_typography_extension.dart';
import 'package:pet_match_ai/core/ui/custom_button.dart';
import 'package:pet_match_ai/core/ui/language_notifier.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 80),
                  Row(
                    children: [
                      Icon(Icons.catching_pokemon),
                      const SizedBox(width: 8),
                      Text(AppStrings.title, style: context.typography.title),
                    ],
                  ),
                  LanguageSwitch(),
                ],
              ),
            ),
            Expanded(child: _Body()),
          ],
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final typography = context.typography;
    return Container(
      width: double.infinity,
      color: Colors.amberAccent,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: 0,
            child: Image.network(
              'https://app-api.dev.pet-match.app/media/breeds/cat.png',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.weWillHelpYou, style: typography.header2),
                const SizedBox(height: 20),
                Text(AppStrings.answerFewQuestions, style: typography.body),
              ],
            ),
          ),
          Positioned(
            left: 20,
            bottom: 20,
            right: 20,
            child: CustomButton(
              title: AppStrings.begin,
              onPressed: () {
                router.go(RoutePaths.quizScreen);
              },
            ),
          ),
        ],
      ),
    );
  }
}
