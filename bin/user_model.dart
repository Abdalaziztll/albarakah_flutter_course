import 'dart:convert';

class UserModel {
  String username;
  String password;
  UserModel({
    required this.username,
    required this.password,
  });

  UserModel copyWith({
    String? username,
    String? password,
  }) {
    return UserModel(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'username': username});
    result.addAll({'password': password});
  
    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() => 'UserModel(username: $username, password: $password)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.username == username &&
      other.password == password;
  }

  @override
  int get hashCode => username.hashCode ^ password.hashCode;
}
