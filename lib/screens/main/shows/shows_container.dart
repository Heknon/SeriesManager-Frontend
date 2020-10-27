import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seriesmanager_frontend/components/appbar_tabbar.dart';
import 'package:seriesmanager_frontend/components/main/shows/history_tab.dart';
import 'package:seriesmanager_frontend/components/main/shows/shows_tab.dart';
import 'file:///C:/Users/Ori/Desktop/SeriesManager/seriesmanager_frontend/lib/components/main/shows/recent_tab.dart';
import 'file:///C:/Users/Ori/Desktop/SeriesManager/seriesmanager_frontend/lib/components/main/shows/upcoming_tab.dart';


class ShowsContainer extends StatelessWidget {
  const ShowsContainer({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color brightPurple = Theme.of(context).textTheme.headline6.color;
    return Container(
      color: Theme.of(context).backgroundColor,
      child: AppBarVisibleTabBarScroll.customAppBar(
        appBarTitle: Text(
          "Shows",
          style: TextStyle(color: brightPurple),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: brightPurple),
            onPressed: () => Navigator.of(context).pushNamed("/search/tv"),
          ),
          IconButton(
            icon: Icon(Icons.filter_list, color: brightPurple),
            onPressed: () => null,
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: brightPurple),
            onPressed: () => null,
          ),
        ],
        tabBar: TabBar(
          labelColor: brightPurple,
          indicatorColor: brightPurple,
          tabs: ["SHOWS", "HISTORY", "UPCOMING", "RECENT"].map((e) => Tab(text: e)).toList(),
        ),
        child: TabBarView(
          children: [ShowsTab(), HistoryTab(), UpcomingTab(), RecentTab()],
        ),
      ),
    );
  }
}
