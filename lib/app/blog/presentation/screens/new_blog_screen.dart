import 'package:flutter/material.dart';

class NewBlogScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<NewBlogScreen> createState() => _NewBlogScreenState();
}

class _NewBlogScreenState extends State<NewBlogScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('new_blog'),));
  }
}