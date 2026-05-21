import 'package:flutter/material.dart';
import 'package:pet_match_ai/core/theme/extensions/app_typography_extension.dart';

ThemeData get lightheme => ThemeData(
  useMaterial3: true,
  extensions: [AppTypographyExtension.fromColor(Colors.black)],
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.amberAccent),
);
