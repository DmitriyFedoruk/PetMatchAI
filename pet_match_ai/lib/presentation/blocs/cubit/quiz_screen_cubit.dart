import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_match_ai/domain/models/answer_model.dart';
import 'package:pet_match_ai/domain/models/progress_model.dart';
import 'package:pet_match_ai/domain/quiz_repository.dart';

part 'quiz_screen_state.dart';

class QuizScreenCubit extends Cubit<QuizScreenState> {
  late final QuizRepository repo;
  QuizScreenCubit() : repo = QuizRepository(), super(QuizScreenInitial());

  Future<void> startQuiz(String locale) async {
    final quiz = await repo.startQuiz(locale);
    if (quiz != null) {
      emit(
        QuizScreenLoaded(
          question: quiz.nextQuestion.title,
          progressModel: ProgressModel(
            currentQuestion:
                quiz.stats.totalQuestionsCount -
                quiz.stats.remainingQuestionsCount +
                1,
            totalQuestions: quiz.stats.totalQuestionsCount,
            progress: quiz.stats.totalScore,
          ),
          answers: quiz.nextQuestion.options
              .map(
                (e) => AnswerModel(
                  id: e.id,
                  code: e.code,
                  label: e.label,
                  sortOrder: e.sortOrder,
                ),
              )
              .toList(),
        ),
      );
    } else {
      emit(QuizScreenInitial());
    }
  }

  void setAnswer(int id) {
    if (state is QuizScreenLoaded) {
      final st = state as QuizScreenLoaded;
      emit(st.copyWith(selectedId: () => id));
    }
  }

  Future<void> answerOnQuestion() async {
    if (state is QuizScreenLoaded) {
      final st = state as QuizScreenLoaded;
      emit(st.copyWith(selectedId: () => null));
    }
  }
}
