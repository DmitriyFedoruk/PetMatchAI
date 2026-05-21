import 'package:flutter/material.dart';
import 'package:pet_match_ai/core/const/enums.dart';
import 'package:pet_match_ai/core/theme/extensions/app_typography_extension.dart';

final ValueNotifier<LanguageType> languageNotifier = ValueNotifier(
  LanguageType.en,
);

class LanguageSwitch extends StatelessWidget {
  const LanguageSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: languageNotifier,
      builder: (context, language, fixedChild) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(60),
          ),
          padding: EdgeInsets.all(2),
          child: Row(
            children: LanguageType.values
                .map(
                  (e) => GestureDetector(
                    onTap: () {
                      languageNotifier.value = e;
                    },
                    child: _Item(label: e.label, isActive: language == e),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}

class _Item extends StatelessWidget {
  final String label;
  final bool isActive;
  const _Item({required this.label, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isActive ? Colors.black54 : Colors.transparent,
        borderRadius: BorderRadius.circular(40),
      ),
      width: 40,
      alignment: Alignment.center,
      padding: EdgeInsets.all(6),
      child: Text(
        label,
        style: context.typography.title.copyWith(
          color: isActive ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
