import 'package:blog/app/routes/presentation/bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String pageTitle;
  const CustomAppBar({super.key, required this.pageTitle});

  @override
  Widget build(BuildContext context) {
    final bottomNavBloc = context.read<BottomNavigationBloc>();
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: .spaceBetween,
        spacing: 4,
        children: [
          const Text(
            'Bloggo',
            style: TextStyle(color: Color(0xFF4648D4), fontSize: 24),
          ),
          SizedBox(
            child: Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(pageTitle, style: const TextStyle(fontSize: 14)),
                GestureDetector(
                  onTap: () {
                    if (bottomNavBloc.state < 3) {
                      bottomNavBloc.add(
                        const NavigateToCustomPageEvent(pageIndex: 3),
                      );
                    }
                  },
                  child: const DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0xFF4648D4),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: SizedBox(
                        child: Icon(Icons.person_outline, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
