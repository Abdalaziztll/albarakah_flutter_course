import 'dart:convert';

import 'package:flutter/foundation.dart';

class QuestionModel {
  String question;
  num availableTime;
  List<AnswerModel> answers;
  QuestionModel({
    required this.question,
    required this.availableTime,
    required this.answers,
  });

  QuestionModel copyWith({
    String? question,
    num? availableTime,
    List<AnswerModel>? answer,
  }) {
    return QuestionModel(
      question: question ?? this.question,
      availableTime: availableTime ?? this.availableTime,
      answers: answer ?? this.answers,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'question': question});
    result.addAll({'availableTime': availableTime});
    result.addAll({'answer': answers.map((x) => x.toMap()).toList()});

    return result;
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      question: map['question'] ?? '',
      availableTime: map['availableTime'] ?? 0,
      answers: List<AnswerModel>.from(
          map['answer']?.map((x) => AnswerModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'QuestionModel(question: $question, availableTime: $availableTime, answer: $answers)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QuestionModel &&
        other.question == question &&
        other.availableTime == availableTime &&
        listEquals(other.answers, answers);
  }

  @override
  int get hashCode =>
      question.hashCode ^ availableTime.hashCode ^ answers.hashCode;
}

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
    final result = <String, dynamic>{};

    result.addAll({'answer': answer});
    result.addAll({'isCorrect': isCorrect});

    return result;
  }

  factory AnswerModel.fromMap(Map<String, dynamic> map) {
    return AnswerModel(
      answer: map['answer'] ?? '',
      isCorrect: map['isCorrect'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnswerModel.fromJson(String source) =>
      AnswerModel.fromMap(json.decode(source));

  @override
  String toString() => 'AnswerModel(answer: $answer, isCorrect: $isCorrect)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AnswerModel &&
        other.answer == answer &&
        other.isCorrect == isCorrect;
  }

  @override
  int get hashCode => answer.hashCode ^ isCorrect.hashCode;
}
