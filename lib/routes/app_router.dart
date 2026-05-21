import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/splash_screen.dart';
import '../screens/home_screen.dart';
import '../screens/tracing_screen.dart';
import '../screens/reward_screen.dart';
import '../screens/parent_dashboard.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/tracing',
        builder: (context, state) => const TracingScreen(),
      ),
      GoRoute(
        path: '/reward',
        builder: (context, state) => const RewardScreen(),
      ),
      GoRoute(
        path: '/parent',
        builder: (context, state) => const ParentDashboard(),
      ),
    ],
  );
}
