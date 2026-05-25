import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pet_match_ai/data/dto/answre_dto.dart';
import 'package:pet_match_ai/data/dto/start_quiz_dto.dart';
import 'package:pet_match_ai/data/dto/user_dto.dart';
import 'package:pet_match_ai/domain/quiz_repository.dart';

class DioService {
  DioService._privateConstructor();

  // The single instance of the class
  static final DioService _instance = DioService._privateConstructor();

  // Public getter to access the instance
  static DioService get instance => _instance;

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://app-api.dev.pet-match.app/api/v1/questionnaire',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      extra: <String, dynamic>{'accept': 'application/json'},
      contentType: 'application/json',
    ),
  );

  Future<StartQuizDto?> start(String locale) async {
    try {
      final res = await dio.post(
        '/start',
        queryParameters: {'locale': locale},
        data: UserDTO(
          externalId: 'EternalID2',
          email: 'testemail3@test.com',
          phone: '+375256689305',
          firstName: 'D3em',
          lastName: '4eDm',
          displayName: 'DIe4spl',
        ).toJson(),
      );
      if (res.statusCode == 201) {
        return StartQuizDto.fromMap(res.data);
      }
    } on DioException catch (e) {
      if (e.response != null && e.response!.statusCode == 422) {
        log('StatusCode 422 - ${e.response!.data}');
      } else {
        log('Error ${e.response?.statusCode} ${e.response?.statusMessage}');
      }
    } on Exception catch (e) {
      log('Error $e');
    }
    return null;
  }

  Future<StartQuizDto?> answerQuestion(AnswerParams params) async {
    try {
      final res = await dio.post(
        '/users/${params.userId}/answers',
        queryParameters: {'locale': params.locale},
        data: AnswerDTO(
          questionId: params.questionId,
          optionId: params.optionId,
          optionIds: null, //params.optionIds,
          rawValueText: null,
          selectedValue: null,
        ).toJson(),
      );

      if (res.statusCode == 200) {
        return StartQuizDto.fromMap(res.data['session']);
      }
    } on DioException catch (e) {
      if (e.response != null && e.response!.statusCode == 422) {
        log('StatusCode 422 - ${e.response!.data}');
      } else {
        log('Error ${e.response?.statusCode} ${e.response?.statusMessage}');
      }
    } on Exception catch (e) {
      log('Error $e');
    }
    return null;
  }
}
