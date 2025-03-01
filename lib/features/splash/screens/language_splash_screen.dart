import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/theme/theme.dart';
import '../../../../core/utils/fonts/fonts_manager.dart';
import '../../../core/assets/svg/svg_assets.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/widgtes/custom_green_button.dart';
import '../../../core/widgtes/language_button.dart';

class LanguageSplashScreen extends StatefulWidget {
  const LanguageSplashScreen({super.key});

  @override
  State<LanguageSplashScreen> createState() => _LanguageSplashScreenState();
}

class _LanguageSplashScreenState extends State<LanguageSplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize fade animation
    _fadeController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );

    // Start fading animation
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Container(
          decoration: const BoxDecoration(color: AppTheme.primaryColor),
          child: Center(
            child: Column(
              children: [
                const Spacer(),
                Hero(
                  tag: "logo",
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(SVGAssets.splashIcon),
                      SvgPicture.asset(SVGAssets.splashTexts),
                    ],
                  ),
                ),
                const SizedBox(height: 29.59),
                const Text(
                  "WELCOME TO SHIFA HOSPITAL",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: FontsAssets.Nexa,
                      color: AppTheme.whiteColor,
                      fontSize: 16),
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: AppTheme.whiteColor,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(40.0),
                      topLeft: Radius.circular(40.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Please, Select your preferred language",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: FontsAssets.Nexa,
                              color: AppTheme.blackColor,
                              fontSize: 16),
                        ),
                        const SizedBox(height: 21),
                        const LanguageButton(language: "English"),
                        const SizedBox(height: 16),
                        const LanguageButton(language: "العربية"),
                        const SizedBox(height: 32),
                        CustomGreenButton(
                          onPressed: (){
                            Navigator.pushReplacementNamed(context, AppRoutes.onboardingScreen);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
