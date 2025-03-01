import 'package:flutter/material.dart';
import 'package:shifa/features/splash/screens/language_splash_screen.dart';
import 'package:shifa/features/splash/screens/splash_screen.dart';

import '../../features/splash/screens/onboarding_screen.dart';
import 'app_routes.dart';


class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
        case AppRoutes.languageSplash:
        return MaterialPageRoute(builder: (_) => LanguageSplashScreen());
        case AppRoutes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('404 - Page Not Found')),
          ),
        );
    }
  }
}
