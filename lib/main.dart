import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'routes/app_router.dart';

void main() {
  runApp(const BarakhadiBuddyApp());
}

class BarakhadiBuddyApp extends StatelessWidget {
  const BarakhadiBuddyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Barakhadi Buddy',
      theme: AppTheme.lightTheme,
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
