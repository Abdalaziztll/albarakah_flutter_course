// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:model_intro/model/base_model/base_model.dart';

class ProductsModel extends BaseModel {
  String title;
  ProductsModel({
    required this.title,
  });
  

  ProductsModel copyWith({
    String? title,
  }) {
    return ProductsModel(
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
    };
  }

  factory ProductsModel.fromMap(Map<String, dynamic> map) {
    return ProductsModel(
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductsModel.fromJson(String source) => ProductsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProductsModel(title: $title)';

  @override
  bool operator ==(covariant ProductsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title;
  }

  @override
  int get hashCode => title.hashCode;
}
