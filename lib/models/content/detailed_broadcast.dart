import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:seriesmanager_frontend/models/content/broadcast.dart';
import 'package:seriesmanager_frontend/models/entity/company.dart';

import '../media_type.dart';

class DetailedBroadcast extends Broadcast {
  final String homepage;
  final List<Company> productionCompanies;
  final String status;
  final Set<String> lists;
  final MediaType mediaType;
  final Map<int, Set<int>> watchedEpisodes;

  const DetailedBroadcast({
    @required this.homepage,
    @required this.productionCompanies,
    @required this.status,
    @required this.lists,
    @required this.mediaType,
    @required this.watchedEpisodes,
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
          broadcastsLeft: broadcastsLeft,
        );

  @override
  String toString() {
    return 'DetailedBroadcast{homepage: $homepage, productionCompanies: $productionCompanies, status: $status, lists: $lists, mediaType: $mediaType, id: $id, poster: $poster, overview: $overview, name: $name, voteAverage: $voteAverage, voteCount: $voteCount, watched: $watched, broadcastCount: $broadcastCount, releaseDate: $releaseDate}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DetailedBroadcast &&
          runtimeType == other.runtimeType &&
          homepage == other.homepage &&
          productionCompanies == other.productionCompanies &&
          status == other.status &&
          lists == other.lists &&
          mediaType == other.mediaType &&
          id == other.id &&
          poster == other.poster &&
          overview == other.overview &&
          name == other.name &&
          voteAverage == other.voteAverage &&
          voteCount == other.voteCount &&
          watched == other.watched &&
          broadcastCount == other.broadcastCount &&
          releaseDate == other.releaseDate);

  @override
  int get hashCode =>
      homepage.hashCode ^
      productionCompanies.hashCode ^
      status.hashCode ^
      lists.hashCode ^
      mediaType.hashCode ^
      id.hashCode ^
      poster.hashCode ^
      overview.hashCode ^
      name.hashCode ^
      voteAverage.hashCode ^
      voteCount.hashCode ^
      watched.hashCode ^
      broadcastCount.hashCode ^
      releaseDate.hashCode;

  @override
  factory DetailedBroadcast.fromMap(Map<String, dynamic> map) {
    Broadcast bc = Broadcast.fromMap(map);

    return new DetailedBroadcast(
      homepage: map['homepage'] as String,
      productionCompanies: (map['production_companies'] as List).map((e) => Company.fromMap(e)).toList(),
      status: map['status'] as String,
      lists: ((map['lists'] ?? []) as List).map((e) => e as String).toSet(),
      watchedEpisodes: (map["watched_episodes"] as LinkedHashMap).map((key, value) => MapEntry(key, value)),
      mediaType: getMediaType(map['searchType']),
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
    );
  }
}
