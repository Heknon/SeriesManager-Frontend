import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seriesmanager_frontend/bloc/auth/auth_bloc.dart';
import 'package:seriesmanager_frontend/models/tabbed_page.dart';
import 'package:seriesmanager_frontend/screens/main/lists/lists_container.dart';
import 'package:seriesmanager_frontend/screens/main/more/more_container.dart';
import 'package:seriesmanager_frontend/screens/main/movies/movies_container.dart';
import 'package:seriesmanager_frontend/screens/main/shows/shows_container.dart';
import 'package:seriesmanager_frontend/screens/main/statistics/statistics_container.dart';
import 'package:seriesmanager_frontend/services/data_access.dart';

class PageContainer extends StatefulWidget {
  final List<TabbedPage> pages;
  static final GlobalKey<_PageContainerState> stateKey = GlobalKey();
  final bool loadBroadcasts;

  PageContainer({key, @required this.pages}) : loadBroadcasts = false, super(key: stateKey);

  const PageContainer.defaultImpl({key})
      : pages = const [
          TabbedPage(page: ShowsContainer(), name: "Shows", icon: Icon(Icons.tv)),
          TabbedPage(page: ListsContainer(), name: "Lists", icon: Icon(Icons.list)),
          TabbedPage(page: MoviesContainer(), name: "Movies", icon: Icon(Icons.movie)),
          TabbedPage(page: StatisticsContainer(), name: "Statistics", icon: Icon(Icons.insert_chart_outlined)),
          TabbedPage(page: MoreContainer(), name: "More", icon: Icon(Icons.reorder)),
        ],
        loadBroadcasts = false,
        super(key: key);

  const PageContainer.defaultImplLoad({key})
      : pages = const [
          TabbedPage(page: ShowsContainer(), name: "Shows", icon: Icon(Icons.tv)),
          TabbedPage(page: ListsContainer(), name: "Lists", icon: Icon(Icons.list)),
          TabbedPage(page: MoviesContainer(), name: "Movies", icon: Icon(Icons.movie)),
          TabbedPage(page: StatisticsContainer(), name: "Statistics", icon: Icon(Icons.insert_chart_outlined)),
          TabbedPage(page: MoreContainer(), name: "More", icon: Icon(Icons.reorder)),
        ],
        loadBroadcasts = true,
        super(key: key);

  @override
  State<StatefulWidget> createState() => _PageContainerState(pages, loadBroadcasts);
}

class _PageContainerState extends State<PageContainer> {
  final List<TabbedPage> pages;
  final bool loadBroadcasts;
  bool loadedBroadcasts = false;
  int _currentPage = 0;

  _PageContainerState(this.pages, this.loadBroadcasts);

  void updatePage(int pageNum) {
    setState(() {
      _currentPage = pageNum;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loadBroadcasts && !loadedBroadcasts) {
      loadUserBroadcasts(context, BlocProvider.of<AuthBloc>(context).state.token);
      loadedBroadcasts = true;
    }

    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the BottomNavigationBar
          canvasColor: Color.fromRGBO(52, 49, 56, 1),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentPage,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.shifting,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Theme.of(context).textTheme.headline6.color,
          onTap: (pageNum) => updatePage(pageNum),
          items: pages
              .map(
                (page) => BottomNavigationBarItem(
                  icon: page.icon,
                  label: page.name,
                ),
              )
              .toList(),
        ),
      ),
      body: pages[_currentPage].page,
    );
  }
}
