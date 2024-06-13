import 'package:flutter/material.dart';
import 'package:spotify_clone/screens/home.dart';
import 'package:spotify_clone/screens/search.dart';
import 'package:spotify_clone/screens/your_library.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final tabs = [const Home(), const Search(), const YourLibrary()];
  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: tabs[currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          backgroundColor: Colors.grey[850],
          selectedItemColor: Colors.white,
          unselectedLabelStyle: const TextStyle(color: Colors.grey),
          unselectedItemColor: Colors.grey,
          currentIndex: currentTabIndex,
          onTap: (currentIndex) {
            currentTabIndex = currentIndex;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.grey,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.library_music_rounded,
                  color: Colors.grey,
                ),
                label: 'Your Library'),
          ]),
    );
  }
}
