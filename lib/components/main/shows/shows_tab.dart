import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:seriesmanager_frontend/components/broadcast_list.dart';

class ShowsTab extends StatelessWidget {
  const ShowsTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BroadcastList(),
    );
  }
}
