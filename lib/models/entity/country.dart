import 'package:flutter/cupertino.dart';

class Country {
  final String id;
  final String name;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const Country({
    @required this.id,
    @required this.name,
  });

  Country copyWith({
    String id,
    String name,
  }) {
    if ((id == null || identical(id, this.id)) && (name == null || identical(name, this.name))) {
      return this;
    }

    return new Country(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  String toString() {
    return 'Country{id: $id, name: $name}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Country && runtimeType == other.runtimeType && id == other.id && name == other.name);

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

  factory Country.fromMap(Map<String, dynamic> map) {
    return new Country(
      id: map['iso_3166_1'] as String,
      name: map['name'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'iso_3166_1': this.id,
      'name': this.name,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}