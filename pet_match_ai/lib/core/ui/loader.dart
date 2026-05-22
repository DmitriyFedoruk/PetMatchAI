import 'package:flutter/material.dart';
import 'package:pet_match_ai/core/const/strings.dart';
import 'package:pet_match_ai/core/theme/extensions/app_typography_extension.dart';

class Loader extends StatelessWidget {
  final double topPadding;
  const Loader({this.topPadding = 20, super.key});

  @override
  Widget build(BuildContext context) {
    final typography = context.typography;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: topPadding),
          SizedBox(
            width: 60,
            height: 60,
            child: CircularProgressIndicator(
              backgroundColor: Colors.black12,
              color: Colors.amberAccent,
            ),
          ),

          Text(
            AppStrings.restoringYourQuestionnaire,
            style: typography.header,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            AppStrings.loadingYourProgress,
            style: typography.body,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
