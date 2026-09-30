import 'package:blog/app/routes/routers.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:blog/app/auth/presentation/providers/auth_providers.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ...authDataPoviders,
        ...authDomainProvider,
        ...authBlocProviders,
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: GoRouter(
        initialLocation: '/login',
        routes: [...authRoutes],
      ),
    );
  }
}
