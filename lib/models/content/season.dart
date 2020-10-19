import 'package:flutter/cupertino.dart';
import 'package:seriesmanager_frontend/models/content/episode.dart';

import 'broadcast.dart';

class Season extends Broadcast {
  final int seasonNumber;
  final int episodeCount;
  final List<Episode> episodes;

  const Season({
    @required this.seasonNumber,
    @required this.episodeCount,
    @required this.episodes,
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

  factory Season.fromMap(Map<String, dynamic> map) {
    Broadcast bc = Broadcast.fromMap(map);
    return new Season(
      seasonNumber: map['season_number'] as int,
      episodeCount: map['episode_count'] as int,
      episodes: (map['episodes'] as List).map((e) => Episode.fromMap(e)).toList(),
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
