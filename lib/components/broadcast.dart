import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seriesmanager_frontend/models/content/SerializedBroadcast.dart';
import 'package:seriesmanager_frontend/models/content/detailed_broadcast.dart';
import 'package:seriesmanager_frontend/models/content/detailed_tv_show.dart';
import 'package:seriesmanager_frontend/models/content/episode.dart';
import 'package:seriesmanager_frontend/models/content/movie.dart';
import 'package:seriesmanager_frontend/models/content/season.dart';
import 'package:tuple/tuple.dart';
import '../utils/screen_manipulation.dart';
import '../utils/datetime.dart';

class Broadcast extends StatelessWidget {
  final DetailedBroadcast broadcast;

  Broadcast({Key key, @required this.broadcast}) : super(key: key);

  String getCardTitle() {
    String airDate =
        broadcast is DetailedTVShow ? ("• " + (broadcast as DetailedTVShow).lastAirDate.toDateString(true)) : "";
    return "${broadcast is Movie ? "" : broadcast.broadcastsLeft.toString() + " remaining  "}${broadcast.productionCompanies[0].name} $airDate";
  }

  RichText getShowDetailsText(BuildContext context) {
    Episode nextEpisode = getNextEpisode();
    bool inProduction = broadcast is DetailedTVShow && (broadcast as DetailedTVShow).inProduction;
    return RichText(
      text: TextSpan(
        text: '',
        style: TextStyle(height: 1),
        children: [
          TextSpan(
            text: "\n" + broadcast.name,
            style:
                Theme.of(context).textTheme.subtitle2.apply(color: Colors.white, fontWeightDelta: 2, fontSizeFactor: 0.95),
          ),
          TextSpan(
              text: nextEpisode != null
                  ? "\n\n${nextEpisode.seasonNumber}x${nextEpisode.episodeNumber < 10 ? "0${nextEpisode.episodeNumber}" : nextEpisode.episodeNumber} ${nextEpisode.name}"
                  : "\n"),
          TextSpan(
            text: "\n\n" +
                (nextEpisode != null
                    ? "${nextEpisode.releaseDate.toDateStringCurrentYearCheck(true)}"
                    : broadcast.watched && inProduction
                        ? "Continuing"
                        : broadcast.watched && !inProduction
                            ? "Discontinued"
                            : "Movie"),
            style: Theme.of(context).textTheme.bodyText2.apply(color: Colors.grey[700], fontSizeFactor: 0.9),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color bgColor = Theme.of(context).backgroundColor;

    return Container(
      child: Card(
        elevation: 0,
        color: bgColor,
        margin: EdgeInsets.all(8),
        child: InkWell(
          splashColor: Colors.grey[700].withOpacity(0.1),
          hoverColor: bgColor,
          onTap: () => {},
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: broadcast.poster,
                height: context.getPixelCountFromScreenPercentage(height: 15).height,
                fit: BoxFit.fill,
                filterQuality: FilterQuality.high,
              ),
              Expanded(
                child: ListTile(
                  title: Text(
                    getCardTitle(),
                    style: Theme.of(context).textTheme.bodyText2.apply(color: Colors.grey[700], fontSizeFactor: 0.9),
                  ),
                  subtitle: getShowDetailsText(context),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Episode getNextEpisode() {
    if (!(this.broadcast is DetailedTVShow)) return null;
    DetailedTVShow broadcast = this.broadcast as DetailedTVShow;
    int currentSeason = 1;
    int currentEpisode = 1;
    if (broadcast.watchedEpisodes != null)
      for (MapEntry<int, Set<int>> e in broadcast.watchedEpisodes.entries) {
        currentSeason = e.key;
        int maxEpisode = 1;

        for (int i in e.value) {
          if (i > maxEpisode) maxEpisode = i;
        }
        currentEpisode = maxEpisode;
      }

    return broadcast.seasons[currentSeason].episodes[currentEpisode - 1];
  }
}
