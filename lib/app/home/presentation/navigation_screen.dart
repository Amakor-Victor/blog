import 'package:blog/app/blog/presentation/screens/new_blog_screen.dart';
import 'package:blog/app/home/presentation/home_page.dart';
import 'package:blog/app/search/presentation/search_screen.dart';
import 'package:blog/app/settings/presentation/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreen();
}

class _NavigationScreen extends State<NavigationScreen> {
  List<Widget> pages = [const HomePage(),const SearchScreen(),const NewBlogScreen(),const SettingsScreen()];
  late final PageController _controller;
  int currentPage = 0;
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(currentIndex: currentPage,onTap: (index){
setState(() {
  currentPage = index;

}

);_controller.animateToPage(currentPage, duration: const Duration(milliseconds: 400), curve: Curves.easeInOutSine);
      },
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        items: [
          const BottomNavigationBarItem(icon: const Icon(Icons.home), label: 'Home'),
          const BottomNavigationBarItem(icon: const Icon(Icons.search), label: 'Search'),
          const BottomNavigationBarItem(
            icon: const Icon(Icons.add_circle_outline),
            label: 'add',
          ),
          const BottomNavigationBarItem(
            icon: const Icon(Icons.person_rounded),
            label: 'profile',
          ),
        ],
      ),
    );
  }
}
