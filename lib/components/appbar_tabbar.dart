import 'package:flutter/material.dart';

class AppBarVisibleTabBarScroll extends StatelessWidget {
  final TabBarView child;
  final SliverAppBar appBar;

  AppBarVisibleTabBarScroll({Key key, @required this.child, @required this.appBar}) : super(key: key);

  AppBarVisibleTabBarScroll.customAppBar({Key key, @required this.child, appBarTitle: Widget, tabBar: TabBar, actions: List})
      : appBar = SliverAppBar(
          title: appBarTitle,
          actions: actions,
          elevation: 7,
          bottom: tabBar,
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: (appBar.bottom as TabBar).tabs.length,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: appBar.title,
              textTheme: appBar.textTheme,
              bottom: appBar.bottom,
              backgroundColor: appBar.backgroundColor,
              key: appBar.key,
              actions: appBar.actions,
              actionsIconTheme: appBar.actionsIconTheme,
              automaticallyImplyLeading: appBar.automaticallyImplyLeading,
              brightness: appBar.brightness,
              centerTitle: appBar.centerTitle,
              collapsedHeight: appBar.collapsedHeight,
              elevation: appBar.elevation,
              excludeHeaderSemantics: appBar.excludeHeaderSemantics,
              expandedHeight: appBar.expandedHeight,
              flexibleSpace: appBar.flexibleSpace,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              iconTheme: appBar.iconTheme,
              leading: appBar.leading,
              leadingWidth: appBar.leadingWidth,
              onStretchTrigger: appBar.onStretchTrigger,
              pinned: true,
              primary: appBar.primary,
              shadowColor: appBar.shadowColor,
              shape: appBar.shape,
              snap: appBar.snap,
              stretch: appBar.stretch,
              stretchTriggerOffset: appBar.stretchTriggerOffset,
              titleSpacing: appBar.titleSpacing,
              toolbarHeight: appBar.toolbarHeight,
            ),
          ];
        },
        body: child,
      ),
    );
  }
}
