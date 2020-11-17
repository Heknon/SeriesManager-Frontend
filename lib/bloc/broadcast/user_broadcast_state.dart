import 'package:seriesmanager_frontend/models/content/broadcast.dart';

class UserBroadcastState {
  final Set<Broadcast> _broadcasts;

  const UserBroadcastState.of(this._broadcasts);
  UserBroadcastState() : _broadcasts = Set();

  Set<Broadcast> getBroadcasts() {
    return new Set.of(_broadcasts);
  }

  /// return the first broadcast matching test, otherwise null
  Broadcast getFirstBroadcastMatching(bool Function(Broadcast broadcast) test) {
    return _broadcasts.firstWhere(test, orElse: null);
  }

  /// return all the broadcasts matching test
  Set<Broadcast> getBroadcastsMatching(bool Function(Broadcast broadcast) test) {
    return _broadcasts.where(test);
  }
}
