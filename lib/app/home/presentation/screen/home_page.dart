import 'package:blog/app/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog/app/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const new({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthBloc>().state as AuthSuccess;
    return Scaffold(
      appBar: const CustomAppBar(pageTitle: 'Home'),
      body: Center(
        child: Center(child: Text('Home page ${authState.user.id}')),
      ),
    );
  }
}
