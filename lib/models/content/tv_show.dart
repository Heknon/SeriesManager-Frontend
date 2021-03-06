import 'package:flutter/cupertino.dart';
import 'package:seriesmanager_frontend/models/content/detailed_broadcast.dart';
import 'package:seriesmanager_frontend/models/entity/company.dart';

class TVShow extends DetailedBroadcast {
  final double popularity;
  final String backdrop;
  final List<String> originCountry;
  final List<int> genreIds;
  final String originalLanguage;
  final String originalName;
  final List<Company> networks;

  TVShow({
    @required this.popularity,
    @required this.backdrop,
    @required this.originCountry,
    @required this.genreIds,
    @required this.originalLanguage,
    @required this.originalName,
    @required this.networks,
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
    @required broadcastsLeft,
    @required watchedEpisodes,
  }) : super(
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
          broadcastsLeft: broadcastsLeft,
          watchedEpisodes: watchedEpisodes,
        );

  @override
  String toString() {
    return 'TVShow{popularity: $popularity, backdrop: $backdrop, originCountry: $originCountry, genreIds: $genreIds, originalLanguage: $originalLanguage, originalName: $originalName, networks: $networks}';
  }

  factory TVShow.fromMap(Map<String, dynamic> map) {
    DetailedBroadcast bc = DetailedBroadcast.fromMap(map);
    return new TVShow(
      popularity: map['popularity'] as double,
      backdrop: map['backdropUrl'] as String,
      genreIds: (map['genreIds'] as List).map((e) => e as int).toList(),
      originalLanguage: map['original_language'] as String,
      originalName: map['original_name'] as String,
      networks: (map['networks'] as List).map((e) => Company.fromMap(e)).toList(),
      originCountry: (map["origin_country"] as List).map((e) => e as String).toList(),
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
      broadcastsLeft: bc.broadcastsLeft,
      watchedEpisodes: bc.watchedEpisodes,
    );
  }
}
