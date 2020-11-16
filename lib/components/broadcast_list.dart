import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seriesmanager_frontend/bloc/auth/auth_bloc.dart';
import 'package:seriesmanager_frontend/bloc/auth/auth_state.dart';
import 'package:seriesmanager_frontend/models/content/SerializedBroadcast.dart';
import 'package:seriesmanager_frontend/models/content/detailed_broadcast.dart';
import 'package:seriesmanager_frontend/services/data_access.dart';
import 'package:tuple/tuple.dart';

import 'broadcast.dart';

class BroadcastList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (BuildContext context, AuthState state) {
      if (state.token == null) return Center(child: CircularProgressIndicator());
      return Container(
        color: Theme.of(context).backgroundColor,
        child: StreamBuilder(
          initialData: [],
          stream: getDetailedBroadcasts(state.token),
          builder: (context, snap) {
            if (!snap.hasData)
              return ListView.builder(
                itemCount: 0,
                itemBuilder: (BuildContext ctx, index) => null,
              );

            return ListView.builder(
              itemCount: snap.data.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) => Broadcast(
                broadcast: snap.data[index]
              ),
            );
          },
        ),
      );
    });
  }
}
