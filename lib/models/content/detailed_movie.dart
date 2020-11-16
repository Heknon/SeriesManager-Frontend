import 'package:flutter/cupertino.dart';
import 'package:seriesmanager_frontend/models/entity/country.dart';

import 'movie.dart';

class DetailedMovie extends Movie {
  final Object belongsToCollection;
  final int budget;
  final String imdbId;
  final List<Country> productionCountries;
  final double revenue;
  final String tagline;

  DetailedMovie({
    @required this.belongsToCollection,
    @required this.budget,
    @required this.imdbId,
    @required this.productionCountries,
    @required this.revenue,
    @required this.tagline,
    @required adult,
    @required video,
    @required backdrop,
    @required popularity,
    @required originalName,
    @required genreIds,
    @required originalLanguage,
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
          adult: adult,
          video: video,
          backdrop: backdrop,
          popularity: popularity,
          originalName: originalName,
          genreIds: genreIds,
          originalLanguage: originalLanguage,
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
    return 'DetailedMovie{belongsToCollection: $belongsToCollection, budget: $budget, imdbId: $imdbId, productionCountries: $productionCountries, revenue: $revenue, tagline: $tagline}';
  }

  factory DetailedMovie.fromMap(Map<String, dynamic> map) {
    Movie bc = Movie.fromMap(map);
    return new DetailedMovie(
      belongsToCollection: map['belongs_to_collection'] as Object,
      budget: map['budget'] as int,
      imdbId: map['imdb_id'] as String,
      productionCountries: (map['production_countries'] as List).map((e) => Country.fromMap(e)).toList(),
      revenue: map['revenue'] as double,
      tagline: map['tagline'] as String,
      adult: bc.adult,
      video: bc.video,
      backdrop: bc.backdrop,
      popularity: bc.popularity,
      originalName: bc.originalName,
      genreIds: bc.genreIds,
      originalLanguage: bc.originalLanguage,
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
