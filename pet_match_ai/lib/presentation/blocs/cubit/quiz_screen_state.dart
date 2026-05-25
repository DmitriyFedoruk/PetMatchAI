part of 'quiz_screen_cubit.dart';

final class QuizScreenState extends Equatable {
  final bool isLoading;
  final String question;
  final int questionId;
  final ProgressModel? progressModel;
  final List<AnswerModel> answers;
  final int? selectedId;
  const QuizScreenState({
    this.isLoading = false,
    required this.question,
    required this.questionId,
    required this.progressModel,
    required this.answers,
    this.selectedId,
  });

  QuizScreenState copyWith({
    bool? isLoading,
    String? question,
    int? questionId,
    ProgressModel? Function()? progressModel,
    List<AnswerModel>? answers,
    int? Function()? selectedId,
  }) {
    return QuizScreenState(
      isLoading: isLoading ?? this.isLoading,
      question: question ?? this.question,
      questionId: questionId ?? this.questionId,
      progressModel: progressModel != null
          ? progressModel()
          : this.progressModel,
      answers: answers ?? this.answers,
      selectedId: selectedId != null ? selectedId() : this.selectedId,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    question,
    questionId,
    progressModel,
    answers,
    selectedId,
  ];
}
