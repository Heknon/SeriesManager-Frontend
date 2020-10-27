import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seriesmanager_frontend/models/content/detailed_broadcast.dart';
import 'dart:math' as math;

class Broadcast extends StatelessWidget {
  final DetailedBroadcast broadcast;

  const Broadcast({Key key, this.broadcast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Card(
        child: InkWell(
          onTap: ,
          child: Column(),
        ),

      ),
    );
  }
}
