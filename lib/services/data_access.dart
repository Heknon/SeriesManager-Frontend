import 'package:seriesmanager_frontend/models/content/detailed_broadcast.dart';
import 'package:seriesmanager_frontend/models/content/detailed_movie.dart';
import 'package:seriesmanager_frontend/models/content/detailed_tv_show.dart';
import 'package:seriesmanager_frontend/models/media_type.dart';

import '../endpoints.dart';

Stream<DetailedBroadcast> getDetailedBroadcasts(String token) async* {
  List<Map<String, Object>> info = await V1.accessInformation(token, V1.detailedBroadcasts);

  for (Map<String, Object> i in info) {
    MediaType type = getMediaType(i["searchType"]);
    if (type == MediaType.Movie) {
      yield DetailedMovie.fromMap(i);
    } else if (type == MediaType.Tv) {
      yield DetailedTVShow.fromMap(i);
    }
  }

}