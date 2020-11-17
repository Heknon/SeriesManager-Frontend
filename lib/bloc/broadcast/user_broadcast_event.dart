import 'package:seriesmanager_frontend/models/content/broadcast.dart';

class UserBroadcastEvent {
  const UserBroadcastEvent();
}

class BroadcastLoadEvent<T extends Broadcast> extends UserBroadcastEvent {
  final T broadcast;

  const BroadcastLoadEvent(this.broadcast) : super();
}

class BroadcastUnloadEvent extends UserBroadcastEvent {
  final bool Function(Broadcast broadcast) unloadFilter;

  const BroadcastUnloadEvent(this.unloadFilter) : super();
}