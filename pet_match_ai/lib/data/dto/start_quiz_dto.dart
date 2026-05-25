import 'dart:convert';

class StartQuizDto {
  final User? user;
  final Stats stats;
  final NextQuestion nextQuestion;
  final bool isNewUser;
  final bool isNewProfile;

  StartQuizDto({
    required this.user,
    required this.stats,
    required this.nextQuestion,
    required this.isNewUser,
    required this.isNewProfile,
  });

  Map<String, dynamic> toMap() {
    return {
      'user': user?.toMap(),
      'stats': stats.toMap(),
      'next_question': nextQuestion.toMap(),
      'is_new_user': isNewUser,
      'is_new_profile': isNewProfile,
    };
  }

  factory StartQuizDto.fromMap(Map<String, dynamic> map) {
    return StartQuizDto(
      user: map['user'] != null ? User.fromMap(map['user']) : null,
      stats: Stats.fromMap(map['stats']),
      nextQuestion: NextQuestion.fromMap(map['next_question']),
      isNewUser: map['is_new_user'] ?? false,
      isNewProfile: map['is_new_profile'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory StartQuizDto.fromJson(String source) =>
      StartQuizDto.fromMap(json.decode(source));
}

class NextQuestion {
  final int id;
  final String code;
  final String scopeCode;
  final String tag;
  final String title;
  final String helpText;
  final String questionType;
  final int sortOrder;
  final List<Option> options;

  NextQuestion({
    required this.id,
    required this.code,
    required this.scopeCode,
    required this.tag,
    required this.title,
    required this.helpText,
    required this.questionType,
    required this.sortOrder,
    required this.options,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'code': code,
      'scope_code': scopeCode,
      'tag': tag,
      'title': title,
      'help_text': helpText,
      'question_type': questionType,
      'sort_order': sortOrder,
      'options': options.map((x) => x.toMap()).toList(),
    };
  }

  factory NextQuestion.fromMap(Map<String, dynamic> map) {
    return NextQuestion(
      id: map['id']?.toInt() ?? 0,
      code: map['code'] ?? '',
      scopeCode: map['scope_code'] ?? '',
      tag: map['tag'] ?? '',
      title: map['title'] ?? '',
      helpText: map['help_text'] ?? '',
      questionType: map['question_type'] ?? '',
      sortOrder: map['sort_order']?.toInt() ?? 0,
      options: List<Option>.from(map['options']?.map((x) => Option.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory NextQuestion.fromJson(String source) =>
      NextQuestion.fromMap(json.decode(source));
}

class Option {
  final int id;
  final String code;
  final String label;
  final int sortOrder;

  Option({
    required this.id,
    required this.code,
    required this.label,
    required this.sortOrder,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'code': code, 'label': label, 'sortOrder': sortOrder};
  }

  factory Option.fromMap(Map<String, dynamic> map) {
    return Option(
      id: map['id']?.toInt() ?? 0,
      code: map['code'] ?? '',
      label: map['label'] ?? '',
      sortOrder: map['sortOrder']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Option.fromJson(String source) => Option.fromMap(json.decode(source));
}

class Stats {
  final int profileId;
  final String status;
  final String? resolvedScopeCode;
  final int totalScore;
  final int answeredQuestionsCount;
  final int totalQuestionsCount;
  final int remainingQuestionsCount;
  final int progressPercent;
  final ByScope scoresByScope;
  final ByScope answeredByScope;
  final DateTime? completedAt;
  final int? lastAnsweredQuestionId;
  final String selectedPetType;

  Stats({
    required this.profileId,
    required this.status,
    required this.resolvedScopeCode,
    required this.totalScore,
    required this.answeredQuestionsCount,
    required this.totalQuestionsCount,
    required this.remainingQuestionsCount,
    required this.progressPercent,
    required this.scoresByScope,
    required this.answeredByScope,
    required this.completedAt,
    required this.lastAnsweredQuestionId,
    required this.selectedPetType,
  });

  Map<String, dynamic> toMap() {
    return {
      'profile_id': profileId,
      'status': status,
      'resolved_scope_code': resolvedScopeCode,
      'total_score': totalScore,
      'answered_questions_count': answeredQuestionsCount,
      'total_questions_count': totalQuestionsCount,
      'remaining_questions_count': remainingQuestionsCount,
      'progress_percent': progressPercent,
      'scores_by_scope': scoresByScope.toMap(),
      'answered_by_scope': answeredByScope.toMap(),
      'completed_at': completedAt,
      'last_answered_question_id': lastAnsweredQuestionId,
      'selected_pet_type': selectedPetType,
    };
  }

  factory Stats.fromMap(Map<String, dynamic> map) {
    return Stats(
      profileId: map['profile_id']?.toInt() ?? 0,
      status: map['status'] ?? '',
      resolvedScopeCode: map['resolved_scope_code'] ?? '',
      totalScore: map['total_score']?.toInt() ?? 0,
      answeredQuestionsCount: map['answered_questions_count']?.toInt() ?? 0,
      totalQuestionsCount: map['total_questions_count']?.toInt() ?? 0,
      remainingQuestionsCount: map['remaining_questions_count']?.toInt() ?? 0,
      progressPercent: map['progress_percent']?.toInt() ?? 0,
      scoresByScope: ByScope.fromMap(map['scores_by_scope']),
      answeredByScope: ByScope.fromMap(map['answered_by_scope']),
      completedAt: DateTime.tryParse(map['completed_at'] ?? ''),
      lastAnsweredQuestionId: map['last_answered_question_id']?.toInt() ?? 0,
      selectedPetType: map['selected_pet_type'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Stats.fromJson(String source) => Stats.fromMap(json.decode(source));
}

class ByScope {
  final int additionalProp1;
  final int additionalProp2;
  final int additionalProp3;

  ByScope({
    required this.additionalProp1,
    required this.additionalProp2,
    required this.additionalProp3,
  });

  Map<String, dynamic> toMap() {
    return {
      'additional_prop1': additionalProp1,
      'additional_prop2': additionalProp2,
      'additional_prop3': additionalProp3,
    };
  }

  factory ByScope.fromMap(Map<String, dynamic> map) {
    return ByScope(
      additionalProp1: map['additional_prop1']?.toInt() ?? 0,
      additionalProp2: map['additional_prop2']?.toInt() ?? 0,
      additionalProp3: map['additional_prop3']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ByScope.fromJson(String source) =>
      ByScope.fromMap(json.decode(source));
}

class User {
  final int id;
  final String externalId;
  final String email;
  final String phone;
  final String firstName;
  final String lastName;
  final String displayName;
  final String status;

  User({
    required this.id,
    required this.externalId,
    required this.email,
    required this.phone,
    required this.firstName,
    required this.lastName,
    required this.displayName,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'external_id': externalId,
      'email': email,
      'phone': phone,
      'first_name': firstName,
      'last_name': lastName,
      'display_name': displayName,
      'status': status,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt() ?? 0,
      externalId: map['external_id'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      firstName: map['first_name'] ?? '',
      lastName: map['last_name'] ?? '',
      displayName: map['display_name'] ?? '',
      status: map['status'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
