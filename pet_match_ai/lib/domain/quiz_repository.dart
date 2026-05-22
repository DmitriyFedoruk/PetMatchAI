import 'package:pet_match_ai/data/dio_service.dart';
import 'package:pet_match_ai/data/dto/start_quiz_dto.dart';

class QuizRepository {
  Future<StartQuizDto?> startQuiz(String locale) async {
    final res = await DioService.instance.start(locale);
    return res;
  }
}
