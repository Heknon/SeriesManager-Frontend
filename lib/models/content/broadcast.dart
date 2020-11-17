import 'package:flutter/cupertino.dart';

class Broadcast {
  final int id;
  final String poster;
  final String overview;
  final String name;
  final double voteAverage;
  final int voteCount;
  final bool watched;
  final int broadcastCount;
  final DateTime releaseDate;
  final int broadcastsLeft;

  const Broadcast({
    @required this.id,
    @required this.poster,
    @required this.overview,
    @required this.name,
    @required this.voteAverage,
    @required this.voteCount,
    @required this.watched,
    @required this.broadcastCount,
    @required this.releaseDate,
    @required this.broadcastsLeft,
  });

  @override
  String toString() {
    return 'Broadcast{id: $id, poster: $poster, overview: $overview, name: $name, voteAverage: $voteAverage, voteCount: $voteCount, watched: $watched, broadcastCount: $broadcastCount, releaseDate: $releaseDate}';
  }


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Broadcast &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          poster == other.poster &&
          overview == other.overview &&
          name == other.name &&
          voteAverage == other.voteAverage &&
          voteCount == other.voteCount &&
          watched == other.watched &&
          broadcastCount == other.broadcastCount &&
          releaseDate == other.releaseDate &&
          broadcastsLeft == other.broadcastsLeft;

  @override
  int get hashCode =>
      id.hashCode ^
      poster.hashCode ^
      overview.hashCode ^
      name.hashCode ^
      voteAverage.hashCode ^
      voteCount.hashCode ^
      watched.hashCode ^
      broadcastCount.hashCode ^
      releaseDate.hashCode ^
      broadcastsLeft.hashCode;

  factory Broadcast.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    String date = map.containsKey("first_air_date")
        ? "first_air_date"
        : map.containsKey("air_date")
            ? "air_date"
            : "release_date";
    return Broadcast(
      id: map['id'] as int,
      poster: map['posterUrl'] as String,
      overview: map['overview'] as String,
      name: map['name'] as String ?? map['title'] as String,
      voteAverage: map['vote_average'] as double,
      voteCount: map['vote_count'] as int,
      watched: map['watched'] as bool,
      broadcastCount: map['broadcastCount'] as int,
      releaseDate: DateTime.fromMillisecondsSinceEpoch((map[date]["epochSeconds"] as int) * 1000),
      broadcastsLeft: map['broadcasts_left'] as int
    );
  }
}
