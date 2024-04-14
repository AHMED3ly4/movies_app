import 'package:flutter/material.dart';
import 'package:movies_app/tabs/browse_tab/view/browse_tab.dart';
import 'package:movies_app/tabs/home_tab/home_tab.dart';
import 'package:movies_app/tabs/search_tab/view/search_tab.dart';
import 'package:movies_app/tabs/watchlist_tab/watchlist_tab.dart';

class HomeScreen extends StatefulWidget {
static const routeName='/';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex=0;
  List<Widget> tabs=[
    HomeTab(),
    SearchTab(),
    BrowseTab(),
    WatchlistTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
            selectedIndex =value;
            setState(() {
            });
            },
            items:const [
              BottomNavigationBarItem(
                icon:  Icon(Icons.home),
                label: 'HOME',
              ),
              BottomNavigationBarItem(
                icon:  Icon(Icons.search),
                label: 'SEARCH',
              ),
              BottomNavigationBarItem(
                icon:  ImageIcon(
                  AssetImage(
                    'assets/images/Icon material-movie.png'
                  ),
                ),
                label: 'BROWSE',
              ),
              BottomNavigationBarItem(
                icon:  Icon(Icons.collections_bookmark_rounded),
                label: 'WATCHLIST',
              ),
            ],
        ),
        body: tabs[selectedIndex],
      ),
    );
  }
}
