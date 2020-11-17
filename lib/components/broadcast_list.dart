import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seriesmanager_frontend/bloc/broadcast/user_broadcast_bloc.dart';
import 'package:seriesmanager_frontend/bloc/broadcast/user_broadcast_state.dart';
import 'package:seriesmanager_frontend/models/content/broadcast.dart' as bc;

import 'broadcast.dart';

class BroadcastList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBroadcastBloc, UserBroadcastState>(builder: (BuildContext context, UserBroadcastState state) {
      List<bc.Broadcast> broadcasts = state.getBroadcasts().toList();
      return Container(
          color: Theme.of(context).backgroundColor,
          child: ListView.builder(
            itemCount: broadcasts.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) => Broadcast(broadcast: broadcasts[index]),
          ));
    });
  }
}
