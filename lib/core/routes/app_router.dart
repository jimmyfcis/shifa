import 'package:flutter/material.dart';
import 'package:shifa/core/models/blog_model.dart';
import 'package:shifa/core/models/radiolog_model.dart';
import 'package:shifa/features/Blog%20Detail/screens/blog_detail_screen.dart';
import 'package:shifa/features/Blogs/screens/blogs_screen.dart';
import 'package:shifa/features/Booking/screens/booking_screen.dart';
import 'package:shifa/features/Contact%20us/screens/contact_us_screen.dart';
import 'package:shifa/features/My%20Care/screens/my_care_screen.dart';
import 'package:shifa/features/My%20Profile/screens/my_profie_screen.dart';
import 'package:shifa/features/Radiology%20Detail/screens/radiology_details_screen.dart';
import 'package:shifa/features/Radiology/screens/radiology_screen.dart';
import 'package:shifa/features/Rate%20Your%20Visit/screens/rate_your_visit_screen.dart';
import 'package:shifa/features/authentication/screens/login_screen.dart';
import 'package:shifa/features/home/screens/home_screen.dart';
import 'package:shifa/features/settings/screens/settings_screen.dart';
import 'package:shifa/features/splash/screens/language_splash_screen.dart';
import 'package:shifa/features/splash/screens/splash_screen.dart';

import '../../features/Privacy Policy/screens/privacy_policy_screen.dart';
import '../../features/Profile/screens/profile_screen.dart';
import '../../features/Terms And Conditions/screens/terms_and_conditions_screen.dart';
import '../../features/authentication/screens/verify_code_screen.dart';
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
      case AppRoutes.myCare:
        return MaterialPageRoute(builder: (_) => MyCareScreen());

      case AppRoutes.privacyPolicy:
        return MaterialPageRoute(builder: (_) => PrivacyPolicyScreen());
      case AppRoutes.termsAndConditions:
        return MaterialPageRoute(builder: (_) => TermsAndConditionsScreen());
      case AppRoutes.settings:
        return MaterialPageRoute(builder: (_) => SettingsScreen());
      case AppRoutes.contactUs:
        return MaterialPageRoute(builder: (_) => ContactUsScreen());

      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case AppRoutes.verifyOTP:
        return MaterialPageRoute(builder: (_) => VerificationCodeScreen());
      case AppRoutes.blogs:
        return MaterialPageRoute(builder: (_) => BlogsScreen());
      case AppRoutes.booking:
        return MaterialPageRoute(builder: (_) => BookingScreen());
      case AppRoutes.rateYourVisit:
        return MaterialPageRoute(builder: (_) => RateYourVisitScreen());
      case AppRoutes.radiology:
        return MaterialPageRoute(builder: (_) => RadiologyScreen());
      case AppRoutes.radiologyDetail:
        return MaterialPageRoute(
            builder: (_) => RadiologyDetailsScreen(
                  radiologyReport: settings.arguments as RadiologyModel,
                ));
      case AppRoutes.blogDetails:
        final BlogModel blog = settings.arguments as BlogModel;
        return MaterialPageRoute(
            builder: (_) => BlogDetailScreen(
                  blog: blog,
                ));
      case AppRoutes.myProfile:
        return MaterialPageRoute(builder: (_) => MyProfie());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('404 - Page Not Found')),
          ),
        );
    }
  }
}
