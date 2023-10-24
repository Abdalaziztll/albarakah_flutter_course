import 'dart:convert';

class UserModel {
  String name;
  String password;
  UserModel({
    required this.name,
    required this.password,
  });

  UserModel copyWith({
    String? name,
    String? password,
  }) {
    return UserModel(
      name: name ?? this.name,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'name': name});
    result.addAll({'password': password});
  
    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() => 'UserModel(name: $name, password: $password)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.name == name &&
      other.password == password;
  }

  @override
  int get hashCode => name.hashCode ^ password.hashCode;
}
