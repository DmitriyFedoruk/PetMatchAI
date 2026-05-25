import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_match_ai/data/dto/start_quiz_dto.dart';
import 'package:pet_match_ai/domain/models/answer_model.dart';
import 'package:pet_match_ai/domain/models/progress_model.dart';
import 'package:pet_match_ai/domain/quiz_repository.dart';

part 'quiz_screen_state.dart';

class QuizScreenCubit extends Cubit<QuizScreenState> {
  late final QuizRepository repo;
  int userId = 1;
  QuizScreenCubit()
    : repo = QuizRepository(),
      super(
        QuizScreenState(
          isLoading: true,
          question: '',
          questionId: 0,
          progressModel: null,
          answers: [],
        ),
      );

  Future<void> startQuiz(String locale) async {
    final quiz = await repo.startQuiz(locale);
    if (quiz != null) {
      userId = quiz.user?.id ?? 0;
      _emitNewQuestion(quiz);
    } else {
      emit(state.copyWith(isLoading: false));
    }
  }

  void setAnswer(int id) {
    emit(state.copyWith(selectedId: () => id));
  }

  Future<void> answerOnQuestion(String locale) async {
    emit(state.copyWith(isLoading: true));
    final res = await repo.answerQuestions(
      AnswerParams(
        userId: userId,
        locale: locale,
        questionId: state.questionId,
        optionId: state.selectedId ?? 0,
        optionIds: [state.selectedId ?? 0],
      ),
    );
    if (res != null) {
      _emitNewQuestion(res);
    } else {
      emit(state.copyWith(selectedId: () => null, isLoading: false));
    }
  }

  void _emitNewQuestion(StartQuizDto quiz) {
    emit(
      QuizScreenState(
        isLoading: false,
        question: quiz.nextQuestion.title,
        questionId: quiz.nextQuestion.id,
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
  }
}
