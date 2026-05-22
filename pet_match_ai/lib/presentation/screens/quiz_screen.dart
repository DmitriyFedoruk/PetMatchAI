import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_match_ai/core/const/strings.dart';
import 'package:pet_match_ai/core/theme/extensions/app_typography_extension.dart';
import 'package:pet_match_ai/core/ui/custom_button.dart';
import 'package:pet_match_ai/core/ui/language_notifier.dart';
import 'package:pet_match_ai/core/ui/loader.dart';
import 'package:pet_match_ai/domain/models/answer_model.dart';
import 'package:pet_match_ai/domain/models/progress_model.dart';
import 'package:pet_match_ai/presentation/blocs/cubit/quiz_screen_cubit.dart';
import 'package:pet_match_ai/presentation/widgets/answers_sector.dart';
import 'package:pet_match_ai/presentation/widgets/quiz_progress_indicator.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          QuizScreenCubit()..startQuiz(languageNotifier.value.code),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppStrings.title, style: context.typography.title),
                    LanguageSwitch(),
                  ],
                ),
                Expanded(child: const _Body()),
                const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<QuizScreenCubit, QuizScreenState, bool>(
      selector: (state) => state is QuizScreenLoaded,
      builder: (context, isLoaded) {
        return isLoaded ? _Question() : const Loader(topPadding: 0);
      },
    );
  }
}

class _Question extends StatelessWidget {
  const _Question();

  @override
  Widget build(BuildContext context) {
    final typography = context.typography;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.pleaseAnswer, style: typography.body),
        BlocSelector<QuizScreenCubit, QuizScreenState, String>(
          selector: (state) {
            if (state is QuizScreenLoaded) {
              return state.question;
            }
            return '';
          },
          builder: (context, title) {
            return Text(title, style: typography.header);
          },
        ),
        BlocSelector<QuizScreenCubit, QuizScreenState, ProgressModel?>(
          selector: (state) {
            if (state is QuizScreenLoaded) {
              return state.progressModel;
            }
            return null;
          },
          builder: (context, state) {
            return QuizProgressIndicator(
              currentQuestion: state?.currentQuestion ?? 1,
              totalQuestions: state?.totalQuestions ?? 1,
              progress: state?.progress ?? 0,
            );
          },
        ),
        const SizedBox(height: 20),

        BlocSelector<
          QuizScreenCubit,
          QuizScreenState,
          ({List<AnswerModel> answers, int? selectedId})
        >(
          selector: (state) {
            if (state is QuizScreenLoaded) {
              return (answers: state.answers, selectedId: state.selectedId);
            }
            return (answers: [], selectedId: null);
          },
          builder: (context, state) {
            return AnswersSector(
              answers: state.answers,
              selectedId: state.selectedId,
            );
          },
        ),
        Spacer(),

        BlocSelector<QuizScreenCubit, QuizScreenState, bool>(
          selector: (state) {
            if (state is QuizScreenLoaded) {
              return state.selectedId != null;
            }
            return false;
          },
          builder: (context, isSelected) {
            return isSelected
                ? CustomButton(
                    onPressed: () {
                      context.read<QuizScreenCubit>().answerOnQuestion();
                    },
                    title: AppStrings.continue_,
                  )
                : const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
