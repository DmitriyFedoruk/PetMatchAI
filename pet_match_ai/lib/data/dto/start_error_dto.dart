import 'dart:convert';

class ErrorDto {
  final List<Detail> detail;

  ErrorDto({required this.detail});

  Map<String, dynamic> toMap() {
    return {'detail': detail.map((x) => x.toMap()).toList()};
  }

  factory ErrorDto.fromMap(Map<String, dynamic> map) {
    return ErrorDto(
      detail: List<Detail>.from(map['detail']?.map((x) => Detail.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ErrorDto.fromJson(String source) =>
      ErrorDto.fromMap(json.decode(source));
}

class Detail {
  final List<dynamic> loc;
  final String msg;
  final String type;

  Detail({required this.loc, required this.msg, required this.type});

  Map<String, dynamic> toMap() {
    return {'loc': loc, 'msg': msg, 'type': type};
  }

  factory Detail.fromMap(Map<String, dynamic> map) {
    return Detail(
      loc: List<dynamic>.from(map['loc']),
      msg: map['msg'] ?? '',
      type: map['type'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Detail.fromJson(String source) => Detail.fromMap(json.decode(source));
}
