import 'package:flutter/material.dart';
import 'package:shifa/features/Contact%20us/screens/contact_us_screen.dart';
import 'package:shifa/features/Profile/screens/profile_screen.dart';
import 'package:shifa/features/home/screens/home_screen.dart';
import 'package:shifa/features/settings/screens/settings_screen.dart';
import 'package:shifa/features/splash/screens/language_splash_screen.dart';
import 'package:shifa/features/splash/screens/splash_screen.dart';

import '../../features/Privacy Policy/screens/privacy_policy_screen.dart';
import '../../features/Terms And Conditions/screens/terms_and_conditions_screen.dart';
import '../../features/splash/screens/onboarding_screen.dart';
import 'app_routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case AppRoutes.languageSplash:
        return MaterialPageRoute(builder: (_) => LanguageSplashScreen());
      case AppRoutes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case AppRoutes.profile:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case AppRoutes.privacyPolicy:
        return MaterialPageRoute(builder: (_) => PrivacyPolicyScreen());
      case AppRoutes.termsAndConditions:
        return MaterialPageRoute(builder: (_) => TermsAndConditionsScreen());
      case AppRoutes.settings:
        return MaterialPageRoute(builder: (_) => SettingsScreen());
      case AppRoutes.contactUs:
        return MaterialPageRoute(builder: (_) => ContactUsScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('404 - Page Not Found')),
          ),
        );
    }
  }
}
