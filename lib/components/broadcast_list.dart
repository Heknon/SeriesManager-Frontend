import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seriesmanager_frontend/bloc/auth/auth_bloc.dart';
import 'package:seriesmanager_frontend/models/content/detailed_broadcast.dart';
import 'package:seriesmanager_frontend/services/data_access.dart';

import 'Broadcast.dart';

class BroadcastList extends StatelessWidget {
  final List<DetailedBroadcast> broadcasts = List();

  @override
  Widget build(BuildContext context) {
    String token = context.bloc<AuthBloc>().state.token;
    return Container(
      child: StreamBuilder(
        initialData: null,
        stream: getDetailedBroadcasts(token),
        builder: (context, snap) {
          DetailedBroadcast bc = snap.data;
          broadcasts.add(bc);
          return ListView.builder(
            itemCount: broadcasts.length,
            itemBuilder: (BuildContext context, int index) => Broadcast(broadcast: bc),
          );
        },
      ),
    );
  }
}
