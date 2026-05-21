import 'package:flutter/material.dart';
import 'package:pet_match_ai/core/theme/text_styles.dart';

@immutable
class AppTypographyExtension extends ThemeExtension<AppTypographyExtension> {
  const AppTypographyExtension({
    required this.header,
    required this.header2,
    required this.title,
    required this.body,
  });

  // Headers
  final TextStyle header;
  final TextStyle header2;

  // Body
  final TextStyle title;

  // Body
  final TextStyle body;

  /// Creates a typography extension with all styles colored by the given primary text color.
  factory AppTypographyExtension.fromColor(Color textColor) {
    return AppTypographyExtension(
      header2: MyTextStyles.arimo_40_500.copyWith(color: textColor),
      header: MyTextStyles.arimo_28_500.copyWith(color: textColor),
      title: MyTextStyles.arimo_14_500.copyWith(color: textColor),
      body: MyTextStyles.arimo_18_100.copyWith(color: textColor),
    );
  }

  @override
  AppTypographyExtension copyWith({
    TextStyle? header,
    TextStyle? header2,
    TextStyle? title,
    TextStyle? body,
  }) {
    return AppTypographyExtension(
      header: header ?? this.header,
      header2: header2 ?? this.header2,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  @override
  AppTypographyExtension lerp(
    ThemeExtension<AppTypographyExtension>? other,
    double t,
  ) {
    if (other is! AppTypographyExtension) {
      return this;
    }
    return AppTypographyExtension(
      header: TextStyle.lerp(header, other.header, t)!,
      header2: TextStyle.lerp(header2, other.header2, t)!,
      title: TextStyle.lerp(title, other.title, t)!,
      body: TextStyle.lerp(body, other.body, t)!,
    );
  }
}

extension TypographyThemeExtension on BuildContext {
  /// Quick access to the app's customized typography colors.
  AppTypographyExtension get typography =>
      Theme.of(this).extension<AppTypographyExtension>()!;
}
