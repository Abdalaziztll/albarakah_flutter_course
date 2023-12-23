// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:model_intro/model/base_model/base_model.dart';

import 'package:model_intro/model/products/product_mode.dart';

class ListProduct extends BaseModel {
  List<ProductsModel> products;
  ListProduct({
    required this.products,
  });

  ListProduct copyWith({
    List<ProductsModel>? products,
  }) {
    return ListProduct(
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'products': products.map((x) => x.toMap()).toList(),
    };
  }

  factory ListProduct.fromMap(Map<String, dynamic> map) {
    return ListProduct(
      products: List<ProductsModel>.from((map['products'] as List<dynamic>).map<ProductsModel>((x) => ProductsModel.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListProduct.fromJson(String source) => ListProduct.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ListProduct(products: $products)';

  @override
  bool operator ==(covariant ListProduct other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.products, products);
  }

  @override
  int get hashCode => products.hashCode;
}
