import 'dart:ffi';

class Places {
  final String name;
  final int rate;

  Places(this.name, this.rate);

  @override
  String toString() {
    return 'UserModel{name: $name, rate: $rate}';
  }
}

class UserModel {
  final int id;
  final String name;
  final Places places;

  UserModel({required this.id, required this.name, required this.places});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'], name: json['name'], places: json['places']);
  }

  @override
  String toString() {
    return 'UserModel{id: $id, name: $name, Places: $places}';
  }
}
