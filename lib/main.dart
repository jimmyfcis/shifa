import 'package:flutter/material.dart';
import 'core/routes/app_router.dart';
import 'core/theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRouter.generateRoute,
      theme: AppTheme.lightTheme,
    );
  }
}
