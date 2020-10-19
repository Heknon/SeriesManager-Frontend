import 'package:flutter/cupertino.dart';

class Person {
  final int id;
  final String creditId;
  final String name;
  final int gender;
  final String profile;
  final String character;
  final int order;

  const Person({
    @required this.id,
    @required this.creditId,
    @required this.name,
    @required this.gender,
    @required this.profile,
    @required this.character,
    @required this.order,
  });

  Person copyWith({
    int id,
    String creditId,
    String name,
    int gender,
    String profile,
    String character,
    int order,
  }) {
    if ((id == null || identical(id, this.id)) &&
        (creditId == null || identical(creditId, this.creditId)) &&
        (name == null || identical(name, this.name)) &&
        (gender == null || identical(gender, this.gender)) &&
        (profile == null || identical(profile, this.profile)) &&
        (character == null || identical(character, this.character)) &&
        (order == null || identical(order, this.order))) {
      return this;
    }

    return new Person(
      id: id ?? this.id,
      creditId: creditId ?? this.creditId,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      profile: profile ?? this.profile,
      character: character ?? this.character,
      order: order ?? this.order,
    );
  }

  @override
  String toString() {
    return 'Person{id: $id, creditId: $creditId, name: $name, gender: $gender, profile: $profile, character: $character, order: $order}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Person &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          creditId == other.creditId &&
          name == other.name &&
          gender == other.gender &&
          profile == other.profile &&
          character == other.character &&
          order == other.order);

  @override
  int get hashCode =>
      id.hashCode ^
      creditId.hashCode ^
      name.hashCode ^
      gender.hashCode ^
      profile.hashCode ^
      character.hashCode ^
      order.hashCode;

  factory Person.fromMap(Map<String, dynamic> map) {
    return new Person(
      id: map['id'] as int,
      creditId: map['creditId'] as String,
      name: map['name'] as String,
      gender: map['gender'] as int,
      profile: map['profile'] as String,
      character: map['character'] as String,
      order: map['order'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'creditId': this.creditId,
      'name': this.name,
      'gender': this.gender,
      'profile': this.profile,
      'character': this.character,
      'order': this.order,
    };
  }
}
