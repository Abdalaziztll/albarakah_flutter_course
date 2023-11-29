// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:flutter_demo/model/base/answer_model.dart';

class CreateQuestionModel {
  String question;
  num availabileTime;
  String author;
  List<AnswerModel> answers;
  CreateQuestionModel({
    required this.question,
    required this.availabileTime,
    required this.author,
    required this.answers,
  });

  CreateQuestionModel copyWith({
    String? question,
    num? availabileTime,
    String? author,
    List<AnswerModel>? answers,
  }) {
    return CreateQuestionModel(
      question: question ?? this.question,
      availabileTime: availabileTime ?? this.availabileTime,
      author: author ?? this.author,
      answers: answers ?? this.answers,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'question': question,
      'availabileTime': availabileTime,
      'author': author,
      'answers': answers.map((x) => x.toMap()).toList(),
    };
  }

  factory CreateQuestionModel.fromMap(Map<String, dynamic> map) {
    return CreateQuestionModel(
      question: map['question'] as String,
      availabileTime: map['availabileTime'] as num,
      author: map['author'] as String,
      answers: List<AnswerModel>.from((map['answers'] as List<dynamic>).map<AnswerModel>((x) => AnswerModel.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateQuestionModel.fromJson(String source) => CreateQuestionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CreateQuestionModel(question: $question, availabileTime: $availabileTime, author: $author, answers: $answers)';
  }

  @override
  bool operator ==(covariant CreateQuestionModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.question == question &&
      other.availabileTime == availabileTime &&
      other.author == author &&
      listEquals(other.answers, answers);
  }

  @override
  int get hashCode {
    return question.hashCode ^
      availabileTime.hashCode ^
      author.hashCode ^
      answers.hashCode;
  }
}
