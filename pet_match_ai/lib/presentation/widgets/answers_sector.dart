import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_match_ai/core/theme/extensions/app_typography_extension.dart';
import 'package:pet_match_ai/core/ui/custom_ink_well.dart';
import 'package:pet_match_ai/domain/models/answer_model.dart';
import 'package:pet_match_ai/presentation/blocs/cubit/quiz_screen_cubit.dart';

class AnswersSector extends StatelessWidget {
  final int? selectedId;
  final List<AnswerModel> answers;
  const AnswersSector({
    required this.answers,
    required this.selectedId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.black26),
      ),
      child: Column(
        children: List.generate(answers.length, (index) {
          final answer = answers[index];
          final isSelected = answer.id == selectedId;
          if (index != answers.length - 1) {
            return Column(
              children: [
                _Item(answer: answer, isSelected: isSelected),
                const SizedBox(height: 10),
              ],
            );
          }
          return _Item(answer: answer, isSelected: isSelected);
        }),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final AnswerModel answer;
  final bool isSelected;
  const _Item({required this.answer, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: CustomInkWell(
        highlightColor: Colors.black12,
        borderRadius: 20,
        onTap: () {
          context.read<QuizScreenCubit>().setAnswer(answer.id);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
          child: Row(
            children: [
              isSelected
                  ? _CircleSelectedCheckBox()
                  : _CircleUnselectedCheckbox(),

              const SizedBox(width: 8),
              Flexible(
                child: Text(answer.label, style: context.typography.body),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CircleUnselectedCheckbox extends StatelessWidget {
  const _CircleUnselectedCheckbox();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 2.0, color: Colors.grey),
      ),
    );
  }
}

class _CircleSelectedCheckBox extends StatelessWidget {
  const _CircleSelectedCheckBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.amber),
      ),
      padding: EdgeInsets.all(4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.amber,
        ),
      ),
    );
  }
}
