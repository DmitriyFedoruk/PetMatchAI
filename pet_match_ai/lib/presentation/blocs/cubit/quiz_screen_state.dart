part of 'quiz_screen_cubit.dart';

sealed class QuizScreenState extends Equatable {}

final class QuizScreenInitial extends QuizScreenState {
  @override
  List<Object?> get props => [];
}

final class QuizScreenLoaded extends QuizScreenState {
  final String question;
  final ProgressModel? progressModel;
  final List<AnswerModel> answers;
  final int? selectedId;
  QuizScreenLoaded({
    required this.question,
    required this.progressModel,
    required this.answers,
    this.selectedId,
  });

  QuizScreenLoaded copyWith({
    String? question,
    ProgressModel? Function()? progressModel,
    List<AnswerModel>? answers,
    int? Function()? selectedId,
  }) {
    return QuizScreenLoaded(
      question: question ?? this.question,
      progressModel: progressModel != null
          ? progressModel()
          : this.progressModel,
      answers: answers ?? this.answers,
      selectedId: selectedId != null ? selectedId() : this.selectedId,
    );
  }

  @override
  List<Object?> get props => [question, progressModel, answers, selectedId];
}
