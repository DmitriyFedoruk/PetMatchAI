import 'package:flutter/material.dart';

class QuizProgressIndicator extends StatelessWidget {
  final int currentQuestion;
  final int totalQuestions;
  final int progress;
  const QuizProgressIndicator({
    required this.currentQuestion,
    required this.totalQuestions,
    required this.progress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('$currentQuestion / $totalQuestions'),
            Text('$progress%'),
          ],
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: currentQuestion / totalQuestions,
          borderRadius: BorderRadius.circular(40),
        ),
      ],
    );
  }
}
