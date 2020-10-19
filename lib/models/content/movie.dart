import 'package:flutter/src/widgets/framework.dart';
import 'package:seriesmanager_frontend/models/content/detailed_broadcast.dart';

class Movie extends DetailedBroadcast {
  final bool adult;
  final bool video;
  final String backdrop;
  final double popularity;
  final String originalName;
  final List<int> genreIds;
  final String originalLanguage;

  const Movie({
    @required this.adult,
    @required this.video,
    @required this.backdrop,
    @required this.popularity,
    @required this.originalName,
    @required this.genreIds,
    @required this.originalLanguage,
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

  factory Movie.fromMap(Map<String, dynamic> map) {
    DetailedBroadcast bc = DetailedBroadcast.fromMap(map);
    return new Movie(
      adult: map['adult'] as bool,
      video: map['video'] as bool,
      backdrop: map['backdrop_path'] as String,
      popularity: map['popularity'] as double,
      originalName: map['original_name'] as String,
      genreIds: map['genre_ids'] as List<int>,
      originalLanguage: map['original_language'] as String,

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
  }
}
