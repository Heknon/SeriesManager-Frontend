import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seriesmanager_frontend/bloc/auth/auth_bloc.dart';
import 'package:seriesmanager_frontend/models/content/detailed_broadcast.dart';
import 'package:seriesmanager_frontend/services/data_access.dart';

import 'broadcast.dart';

class BroadcastList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String token = context.bloc<AuthBloc>().state.token;
    return Container(
      child: StreamBuilder(
        initialData: [],
        stream: getDetailedBroadcasts(token),
        builder: (context, snap) {
          print(snap.data.length);
          return ListView.builder(
            itemCount: snap.data.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) => Broadcast()
          );
        },
      ),
    );
  }
}
