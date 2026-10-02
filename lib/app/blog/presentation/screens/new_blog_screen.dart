import 'package:blog/app/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class NewBlogScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<NewBlogScreen> createState() => _NewBlogScreenState();
}

class _NewBlogScreenState extends State<NewBlogScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(pageTitle: 'Create'),
      body: Center(child: Text('new_blog')),
    );
  }
}
