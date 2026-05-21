import 'package:flutter/material.dart';
import 'package:pet_match_ai/core/theme/extensions/app_typography_extension.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const CustomButton({required this.onPressed, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.black87,
      height: 52,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: context.typography.body.copyWith(color: Colors.white),
          ),
          const SizedBox(width: 8),
          Icon(Icons.arrow_right_alt, color: Colors.white),
        ],
      ),
    );
  }
}
