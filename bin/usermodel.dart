import 'dart:convert';

class UserModel {
  String name;
  String job;
  UserModel({
    required this.name,
    required this.job,
  });

  UserModel copyWith({
    String? name,
    String? job,
  }) {
    return UserModel(
      name: name ?? this.name,
      job: job ?? this.job,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'name': name});
    result.addAll({'job': job});
  
    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      job: map['job'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() => 'UserModel(name: $name, job: $job)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.name == name &&
      other.job == job;
  }

  @override
  int get hashCode => name.hashCode ^ job.hashCode;
}
