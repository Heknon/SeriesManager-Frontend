import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:kt_dart/collection.dart';
import 'package:seriesmanager_frontend/models/content/SerializedBroadcast.dart';
import 'package:seriesmanager_frontend/models/content/detailed_broadcast.dart';
import 'package:seriesmanager_frontend/models/content/detailed_movie.dart';
import 'package:seriesmanager_frontend/models/content/detailed_tv_show.dart';
import 'package:seriesmanager_frontend/models/media_type.dart';
import 'package:tuple/tuple.dart';

import '../endpoints.dart';

Stream<List<DetailedBroadcast>> getDetailedBroadcasts(String token) async* {
  if (token == null) {
    yield [];
    return;
  }
  dynamic info = await V1.accessInformation(token, V1.detailedBroadcasts);
  List<DetailedBroadcast> bcs = List();

  for (LinkedHashMap<String, dynamic> i in info) {
    MediaType type = getMediaType(i["searchType"]);
    if (type == MediaType.Tv) {
      DetailedBroadcast bc = DetailedTVShow.fromMap(i);
      bcs.add(bc);
      yield bcs;
    } else if (type == MediaType.Movie) {
      DetailedBroadcast bc = DetailedMovie.fromMap(i);
      bcs.add(bc);
      yield bcs;
    }
  }
}

Stream<List<SerializedBroadcast>> getSerializedBroadcasts(String token) async* {
  if (token == null) {
    yield [];
    return;
  }
  dynamic info = await V1.accessInformation(token, V1.broadcast);
  List<SerializedBroadcast> bcs = List();

  for (LinkedHashMap<String, dynamic> i in info) {
    bcs.add(SerializedBroadcast.fromMap(i));
    yield bcs;
  }

}
