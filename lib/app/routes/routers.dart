import 'package:blog/app/auth/presentation/screens/login_page.dart';
import 'package:blog/app/home/presentation/navigation_screen.dart';
import 'package:go_router/go_router.dart';

List<GoRoute> authRoutes = [
  GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
  GoRoute(
    path: '/dashboard',
    builder: (context, state) => const NavigationScreen(),
  ),
];
