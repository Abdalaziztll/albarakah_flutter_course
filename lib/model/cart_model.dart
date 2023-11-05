import 'dart:convert';

import 'package:flutter/foundation.dart';

class CardModel {
  List Carts;
  CardModel({
    required this.Carts,
  });

  CardModel copyWith({
    List? Carts,
  }) {
    return CardModel(
      Carts: Carts ?? this.Carts,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'Carts': Carts});
  
    return result;
  }

  factory CardModel.fromMap(Map<String, dynamic> map) {
    return CardModel(
      Carts: List.from(map['carts']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CardModel.fromJson(String source) => CardModel.fromMap(json.decode(source));

  @override
  String toString() => 'CardModel(Carts: $Carts)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CardModel &&
      listEquals(other.Carts, Carts);
  }

  @override
  int get hashCode => Carts.hashCode;
}
