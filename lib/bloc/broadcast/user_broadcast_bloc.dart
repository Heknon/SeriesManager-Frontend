import 'package:bloc/bloc.dart';
import 'package:seriesmanager_frontend/bloc/broadcast/user_broadcast_event.dart';
import 'package:seriesmanager_frontend/bloc/broadcast/user_broadcast_state.dart';
import 'package:seriesmanager_frontend/models/content/broadcast.dart';

class UserBroadcastBloc extends Bloc<UserBroadcastEvent, UserBroadcastState> {

  UserBroadcastBloc() : super(UserBroadcastState());

  @override
  Stream<UserBroadcastState> mapEventToState(UserBroadcastEvent event) async* {
    Set<Broadcast> broadcasts = state.getBroadcasts();
    if (event is BroadcastLoadEvent) {
      broadcasts.add(event.broadcast);
      yield UserBroadcastState.of(broadcasts);
    } else if (event is BroadcastUnloadEvent) {
      broadcasts.removeWhere(event.unloadFilter);
      yield UserBroadcastState.of(broadcasts);
    }
  }

}