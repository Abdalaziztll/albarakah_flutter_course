// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  int id;
  String name;
  String email;
  AddressModel address;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
  });



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'address': address.toMap(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      address: AddressModel.fromMap(map['address'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, address: $address)';
  }

  


}





class AddressModel {
  String geo;
  String name;
  String city;
  AddressModel({
    required this.geo,
    required this.name,
    required this.city,
  });

  AddressModel copyWith({
    String? geo,
    String? name,
    String? city,
  }) {
    return AddressModel(
      geo: geo ?? this.geo,
      name: name ?? this.name,
      city: city ?? this.city,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'geo': geo,
      'name': name,
      'city': city,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      geo: map['geo'] as String,
      name: map['name'] as String,
      city: map['city'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) => AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AddressModel(geo: $geo, name: $name, city: $city)';

  @override
  bool operator ==(covariant AddressModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.geo == geo &&
      other.name == name &&
      other.city == city;
  }

  @override
  int get hashCode => geo.hashCode ^ name.hashCode ^ city.hashCode;
}
