import 'package:flutter/cupertino.dart';
import 'package:seriesmanager_frontend/models/content/detailed_tv_show.dart';
import 'package:seriesmanager_frontend/models/content/episode.dart';
import 'package:seriesmanager_frontend/models/content/tv_show.dart';

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
  });

  @override
  String toString() {
    return 'Broadcast{id: $id, poster: $poster, overview: $overview, name: $name, voteAverage: $voteAverage, voteCount: $voteCount, watched: $watched, broadcastCount: $broadcastCount, releaseDate: $releaseDate}';
  }

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
      name: map['name'] as String,
      voteAverage: map['vote_average'] as double,
      voteCount: map['vote_count'] as int,
      watched: map['watched'] as bool,
      broadcastCount: map['broadcastCount'] as int,
      releaseDate: DateTime.fromMillisecondsSinceEpoch((map[date]["epochSeconds"] as int) * 1000),
    );
  }
}
