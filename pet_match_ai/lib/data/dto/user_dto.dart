import 'dart:convert';

class UserDTO {
  final String externalId;
  final String email;
  final String phone;
  final String firstName;
  final String lastName;
  final String displayName;

  UserDTO({
    required this.externalId,
    required this.email,
    required this.phone,
    required this.firstName,
    required this.lastName,
    required this.displayName,
  });

  Map<String, dynamic> toMap() {
    return {
      'external_id': externalId,
      'email': email,
      'phone': phone,
      'first_name': firstName,
      'last_name': lastName,
      'display_name': displayName,
    };
  }

  factory UserDTO.fromMap(Map<String, dynamic> map) {
    return UserDTO(
      externalId: map['external_id'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      firstName: map['first_name'] ?? '',
      lastName: map['last_name'] ?? '',
      displayName: map['display_name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDTO.fromJson(String source) =>
      UserDTO.fromMap(json.decode(source));
}
