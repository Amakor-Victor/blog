import 'package:blog/app/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(pageTitle: 'Search'),
      body: const Center(child: const Text('Search screen')),
    );
  }
}
