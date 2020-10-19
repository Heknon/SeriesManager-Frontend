import 'package:flutter/cupertino.dart';
import 'package:seriesmanager_frontend/models/entity/person.dart';

import 'broadcast.dart';

class Episode extends Broadcast {
  final List<Person> crew;
  final int episodeNumber;
  final List<Person> guestStars;
  final int showId;
  final String productionCode;
  final int seasonNumber;

  const Episode({
    @required this.crew,
    @required this.episodeNumber,
    @required this.guestStars,
    @required this.showId,
    @required this.productionCode,
    @required this.seasonNumber,
    @required id,
    @required poster,
    @required overview,
    @required name,
    @required voteAverage,
    @required voteCount,
    @required watched,
    @required broadcastCount,
    @required releaseDate,
  }) : super(
          id: id,
          poster: poster,
          overview: overview,
          name: name,
          voteAverage: voteAverage,
          voteCount: voteCount,
          watched: watched,
          broadcastCount: broadcastCount,
          releaseDate: releaseDate,
        );

  factory Episode.fromMap(Map<String, dynamic> map) {
    Broadcast bc = Broadcast.fromMap(map);
    return new Episode(
      crew: (map['crew'] as List).map((e) => Person.fromMap(e)).toList(),
      episodeNumber: map['episode_number'] as int,
      guestStars: (map['guest_stars'] as List).map((e) => Person.fromMap(e)).toList(),
      showId: map['show_id'] as int,
      productionCode: map['production_code'] as String,
      seasonNumber: map['season_number'] as int,
      id: bc.id,
      poster: bc.poster,
      overview: bc.overview,
      name: bc.name,
      voteAverage: bc.voteAverage,
      voteCount: bc.voteCount,
      watched: bc.watched,
      broadcastCount: bc.broadcastCount,
      releaseDate: bc.releaseDate,
    );
  }
}
