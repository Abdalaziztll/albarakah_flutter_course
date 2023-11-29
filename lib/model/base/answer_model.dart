// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AnswerModel {
  String answer;
  bool isCorrect;
  AnswerModel({
    required this.answer,
    required this.isCorrect,
  });

  AnswerModel copyWith({
    String? answer,
    bool? isCorrect,
  }) {
    return AnswerModel(
      answer: answer ?? this.answer,
      isCorrect: isCorrect ?? this.isCorrect,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'answer': answer,
      'isCorrect': isCorrect,
    };
  }

  factory AnswerModel.fromMap(Map<String, dynamic> map) {
    return AnswerModel(
      answer: map['answer'] as String,
      isCorrect: map['isCorrect'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnswerModel.fromJson(String source) => AnswerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AnswerModel(answer: $answer, isCorrect: $isCorrect)';

  @override
  bool operator ==(covariant AnswerModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.answer == answer &&
      other.isCorrect == isCorrect;
  }

  @override
  int get hashCode => answer.hashCode ^ isCorrect.hashCode;
}
