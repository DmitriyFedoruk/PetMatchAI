import 'package:pet_match_ai/data/dio_service.dart';
import 'package:pet_match_ai/data/dto/start_quiz_dto.dart';

class QuizRepository {
  Future<StartQuizDto?> startQuiz(String locale) async {
    final res = await DioService.instance.start(locale);
    return res;
  }

  Future<StartQuizDto?> answerQuestions(AnswerParams params) async {
    final res = await DioService.instance.answerQuestion(params);
    return res;
  }
}

class AnswerParams {
  final int userId;
  final String locale;
  final int questionId;
  final int optionId;
  final List<int> optionIds;

  AnswerParams({
    required this.userId,
    required this.locale,
    required this.questionId,
    required this.optionId,
    required this.optionIds,
  });
}
