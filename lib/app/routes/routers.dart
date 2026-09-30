import 'package:blog/app/auth/presentation/screens/login_page.dart';
import 'package:go_router/go_router.dart';

List<GoRoute> authRoutes = [
  GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
];
