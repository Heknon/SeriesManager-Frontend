import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seriesmanager_frontend/components/appbar_tabbar.dart';
import 'package:seriesmanager_frontend/components/main/shows/discover_tab.dart';
import 'package:seriesmanager_frontend/components/main/shows/episodes_tab.dart';
import 'package:seriesmanager_frontend/components/main/shows/shows_tab.dart';
import 'package:seriesmanager_frontend/components/search_bar.dart';

class ShowSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color brightPurple = Theme.of(context).textTheme.headline6.color;

    return Scaffold(
      body: AppBarVisibleTabBarScroll(
        appBar: SliverAppBar(
          title: SearchBar(
            onTextChange: (query) => null,
          ),
          bottom: TabBar(
            labelColor: brightPurple,
            indicatorColor: brightPurple,
            tabs: ["SHOWS", "EPISODES", "DISCOVER"].map((e) => Tab(text: e)).toList(),
          ),
        ),
        child: TabBarView(
          children: [ShowsTab(), EpisodesTab(), DiscoverTab()],
        ),
      ),
    );
  }
}
