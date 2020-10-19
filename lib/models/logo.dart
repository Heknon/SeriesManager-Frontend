import 'package:flutter/cupertino.dart';

class Logo {
  final String path;
  final double aspectRatio;


  const Logo({
    @required this.path,
    @required this.aspectRatio,
  });

  Logo copyWith({
    String path,
    double aspectRatio,
  }) {
    if ((path == null || identical(path, this.path)) && (aspectRatio == null || identical(aspectRatio, this.aspectRatio))) {
      return this;
    }

    return new Logo(
      path: path ?? this.path,
      aspectRatio: aspectRatio ?? this.aspectRatio,
    );
  }

  @override
  String toString() {
    return 'Logo{path: $path, aspectRatio: $aspectRatio}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Logo && runtimeType == other.runtimeType && path == other.path && aspectRatio == other.aspectRatio);

  @override
  int get hashCode => path.hashCode ^ aspectRatio.hashCode;

  factory Logo.fromMap(Map<String, dynamic> map) {
    return new Logo(
      path: map['profileUrl'] as String,
      aspectRatio: map['aspect_ratio'] as double,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'profileUrl': this.path,
      'aspect_ratio': this.aspectRatio,
    } as Map<String, dynamic>;
  }

}