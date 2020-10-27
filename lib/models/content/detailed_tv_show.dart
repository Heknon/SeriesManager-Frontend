import 'package:flutter/cupertino.dart';
import 'package:seriesmanager_frontend/models/content/season.dart';
import 'package:seriesmanager_frontend/models/content/tv_show.dart';
import 'package:seriesmanager_frontend/models/entity/person.dart';

import 'episode.dart';

class DetailedTVShow extends TVShow {
  final List<Person> createdBy;
  final List<int> runtime;
  final bool inProduction;
  final List<String> languages;
  final DateTime lastAirDate;
  final Episode lastEpisodeToAir;
  final Episode nextEpisodeToAir;
  final int numberOfEpisodes;
  final int numberOfSeason;
  final List<Season> seasons;

  DetailedTVShow({
    @required this.createdBy,
    @required this.runtime,
    @required this.inProduction,
    @required this.languages,
    @required this.lastAirDate,
    @required this.lastEpisodeToAir,
    @required this.nextEpisodeToAir,
    @required this.numberOfEpisodes,
    @required this.numberOfSeason,
    @required this.seasons,
    @required popularity,
    @required backdrop,
    @required originCountry,
    @required genreIds,
    @required originalLanguage,
    @required originalName,
    @required networks,
    @required homepage,
    @required productionCompanies,
    @required status,
    @required lists,
    @required mediaType,
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
          popularity: popularity,
          backdrop: backdrop,
          originCountry: originCountry,
          genreIds: genreIds,
          originalLanguage: originalLanguage,
          originalName: originalName,
          networks: networks,
          homepage: homepage,
          lists: lists,
          mediaType: mediaType,
          productionCompanies: productionCompanies,
          status: status,
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

  @override
  String toString() {
    return 'DetailedTVShow{$numberOfEpisodes, numberOfSeason: $numberOfSeason}';
  }

  factory DetailedTVShow.fromMap(Map<String, dynamic> map) {
    TVShow bc = TVShow.fromMap(map);
    if (bc == null) return null;

    DetailedTVShow tv = new DetailedTVShow(
      createdBy: (map['created_by'] as List).map((e) => Person.fromMap(e)).toList(),
      runtime: (map['episode_run_time'] as List).map((e) => e as int).toList(),
      inProduction: map['in_production'] as bool,
      languages: (map["languages"] as List).map((e) => e as String).toList(),
      lastAirDate: DateTime.fromMillisecondsSinceEpoch((map['last_air_date']["epochSeconds"] as int) * 1000),
      lastEpisodeToAir: Episode.fromMap(map['last_episode_to_air']),
      nextEpisodeToAir: Episode.fromMap(map['next_episode_to_air']),
      numberOfEpisodes: map['number_of_episodes'] as int,
      numberOfSeason: map['number_of_seasons'] as int,
      seasons: (map["seasons"] as List).map((e) => Season.fromMap(e)).toList(),
      popularity: bc.popularity,
      backdrop: bc.backdrop,
      originCountry: bc.originCountry,
      genreIds: bc.genreIds,
      originalLanguage: bc.originalLanguage,
      originalName: bc.originalName,
      networks: bc.networks,
      homepage: bc.homepage,
      productionCompanies: bc.productionCompanies,
      status: bc.status,
      lists: bc.lists,
      mediaType: bc.mediaType,
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
    return tv;
  }
}
