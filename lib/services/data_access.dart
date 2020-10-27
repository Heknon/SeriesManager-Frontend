import 'dart:collection';

import 'package:seriesmanager_frontend/models/content/broadcast.dart';
import 'package:seriesmanager_frontend/models/content/detailed_broadcast.dart';
import 'package:seriesmanager_frontend/models/content/detailed_movie.dart';
import 'package:seriesmanager_frontend/models/content/detailed_tv_show.dart';
import 'package:seriesmanager_frontend/models/media_type.dart';

import '../endpoints.dart';

Stream<List<DetailedBroadcast>> getDetailedBroadcasts(String token) async* {
  if (token == null) {
    yield [];
    return;
  }
  List<dynamic> info = await V1.accessInformation(token, V1.detailedBroadcasts);
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
