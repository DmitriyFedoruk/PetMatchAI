class AnswerDTO {
  int? questionId;
  int? optionId;
  List<int>? optionIds;
  String? rawValueText;
  SelectedValue? selectedValue;

  AnswerDTO({
    required this.questionId,
    required this.optionId,
    required this.optionIds,
    required this.rawValueText,
    required this.selectedValue,
  });

  AnswerDTO.fromJson(Map<String, dynamic> json) {
    questionId = json['question_id'];
    optionId = json['option_id'];
    optionIds = json['option_ids'].cast<int>();
    rawValueText = json['raw_value_text'];
    selectedValue = json['selected_value'] != null
        ? SelectedValue.fromJson(json['selected_value'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question_id'] = questionId;
    data['option_id'] = optionId;
    data['option_ids'] = optionIds;
    data['raw_value_text'] = rawValueText;
    if (selectedValue != null) {
      data['selected_value'] = selectedValue!.toJson();
    }
    return data;
  }
}

class SelectedValue {
  String? sourceType;
  String? code;
  String? label;

  SelectedValue({this.sourceType, this.code, this.label});

  SelectedValue.fromJson(Map<String, dynamic> json) {
    sourceType = json['source_type'];
    code = json['code'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['source_type'] = sourceType;
    data['code'] = code;
    data['label'] = label;

    return data;
  }
}
