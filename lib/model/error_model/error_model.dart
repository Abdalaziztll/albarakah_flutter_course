// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:model_intro/model/base_model/base_model.dart';

class ErrorModel extends BaseModel {
String message;
  ErrorModel({
    required this.message,
  });

  ErrorModel copyWith({
    String? message,
  }) {
    return ErrorModel(
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
    };
  }

  factory ErrorModel.fromMap(Map<String, dynamic> map) {
    return ErrorModel(
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ErrorModel.fromJson(String source) => ErrorModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ErrorModel(message: $message)';

  @override
  bool operator ==(covariant ErrorModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
