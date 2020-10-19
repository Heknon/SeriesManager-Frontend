import 'package:flutter/cupertino.dart';

import '../logo.dart';

class Company {
  final String logo;
  final Logo logoObj;
  final String originCountry;
  final int id;
  final String name;

  const Company({
    @required this.logo,
    @required this.logoObj,
    @required this.originCountry,
    @required this.id,
    @required this.name,
  });

  Company copyWith({
    String logo,
    Logo logoObj,
    String originCountry,
    int id,
    String name,
  }) {
    if ((logo == null || identical(logo, this.logo)) &&
        (logoObj == null || identical(logoObj, this.logoObj)) &&
        (originCountry == null || identical(originCountry, this.originCountry)) &&
        (id == null || identical(id, this.id)) &&
        (name == null || identical(name, this.name))) {
      return this;
    }

    return new Company(
      logo: logo ?? this.logo,
      logoObj: logoObj ?? this.logoObj,
      originCountry: originCountry ?? this.originCountry,
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  String toString() {
    return 'Company{logo: $logo, logoObj: $logoObj, originCountry: $originCountry, id: $id, name: $name}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Company &&
          runtimeType == other.runtimeType &&
          logo == other.logo &&
          logoObj == other.logoObj &&
          originCountry == other.originCountry &&
          id == other.id &&
          name == other.name);

  @override
  int get hashCode => logo.hashCode ^ logoObj.hashCode ^ originCountry.hashCode ^ id.hashCode ^ name.hashCode;

  factory Company.fromMap(Map<String, dynamic> map) {
    return new Company(
      logo: map['logo_path'] as String,
      logoObj: Logo.fromMap(map['logo']),
      originCountry: map['origin_country'] as String,
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'logo_path': this.logo,
      'logo': this.logoObj,
      'origin_country': this.originCountry,
      'id': this.id,
      'name': this.name,
    };
  }
}
