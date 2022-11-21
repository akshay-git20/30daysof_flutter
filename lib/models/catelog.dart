import 'dart:convert';

import 'package:collection/collection.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

class CatalogModel {
  static List<Item> items = [];

  Item getbyid(int id) => items.firstWhere((element) =>
      element.id ==
      id); //firstwhere returns the first element that satisfies the given test

  Item getbypos(int pos) => items[pos];
}

class Item {
  final int id;
  final String title;
  final String description;
  final num price;
  final String image;

  Item(
    this.id,
    this.title,
    this.description,
    this.price,
    this.image,
  );

  Item copyWith({
    int? id,
    String? title,
    String? description,
    num? price,
    String? image,
  }) {
    return Item(
      id ?? this.id,
      title ?? this.title,
      description ?? this.description,
      price ?? this.price,
      image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      map['id'] as int,
      map['title'] as String,
      map['description'] as String,
      map['price'] as num,
      map['image'] as String,

    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(id: $id, title: $title, description: $description, price: $price, image: $image)';
  }

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.price == price &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        price.hashCode ^
        image.hashCode;
  }
}
