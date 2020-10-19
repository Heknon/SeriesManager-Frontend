import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seriesmanager_frontend/models/tabbed_page.dart';
import 'package:seriesmanager_frontend/screens/main/lists/lists_container.dart';
import 'package:seriesmanager_frontend/screens/main/more/more_container.dart';
import 'package:seriesmanager_frontend/screens/main/movies/movies_container.dart';
import 'package:seriesmanager_frontend/screens/main/shows/shows_container.dart';
import 'package:seriesmanager_frontend/screens/main/statistics/statistics_container.dart';

class PageContainer extends StatefulWidget {
  final List<TabbedPage> pages;

  const PageContainer({key, @required this.pages}) : super(key: key);

  const PageContainer.defaultImpl({key})
      : pages = const [
          TabbedPage(page: ShowsContainer(), name: "Shows", icon: Icon(Icons.tv)),
          TabbedPage(page: ListsContainer(), name: "Lists", icon: Icon(Icons.list)),
          TabbedPage(page: MoviesContainer(), name: "Movies", icon: Icon(Icons.movie)),
          TabbedPage(page: StatisticsContainer(), name: "Statistics", icon: Icon(Icons.insert_chart_outlined)),
          TabbedPage(page: MoreContainer(), name: "More", icon: Icon(Icons.reorder)),
        ],
        super(key: key);

  @override
  State<StatefulWidget> createState() => _PageContainerState(pages);
}

class _PageContainerState extends State<PageContainer> {
  final List<TabbedPage> pages;
  int _currentPage = 0;

  _PageContainerState(this.pages);

  void updatePage(int pageNum) {
    setState(() {
      _currentPage = pageNum;
    });
  }

  @override
  Widget build(BuildContext context) {
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
