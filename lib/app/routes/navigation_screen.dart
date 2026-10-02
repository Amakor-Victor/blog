import 'package:blog/app/blog/presentation/screens/new_blog_screen.dart';
import 'package:blog/app/routes/presentation/bloc/navigation_bloc.dart';
import 'package:blog/app/home/presentation/screen/home_page.dart';
import 'package:blog/app/search/presentation/search_screen.dart';
import 'package:blog/app/settings/presentation/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreen();
}

class _NavigationScreen extends State<NavigationScreen> {
  List<Widget> pages = [
    const HomePage(),
    const SearchScreen(),
    const NewBlogScreen(),
    const SettingsScreen(),
  ];
  late final PageController _controller;
  // int currentPage = 0;
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
    // final navBloc = BlocProvider.of<BottomNavigationBloc>(context);

    final navBloc = context.read<BottomNavigationBloc>();

    return BlocConsumer<BottomNavigationBloc, int>(
      listener: (context, state) {
        if (_controller.hasClients) {
          _controller.jumpToPage(state);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: PageView(controller: _controller, children: pages),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state,
            onTap: (index) {
              navBloc.add(NavigateToCustomPageEvent(pageIndex: index));
              // setState(() {
              //   currentPage = index;
              // });
              // _controller.animateToPage(currentPage, duration: const Duration(milliseconds: 400), curve: Curves.bounceInOut);
              _controller.jumpToPage(navBloc.state);
            },
            selectedItemColor: Colors.purple,
            unselectedItemColor: Colors.black,
            showUnselectedLabels: true,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline),
                label: 'add',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded),
                label: 'profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
