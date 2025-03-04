import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shifa/core/theme/styles.dart';

import '../../../../core/theme/theme.dart';
import '../../../core/assets/svg/svg_assets.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/widgtes/custom_green_button.dart';
import '../../../core/widgtes/language_button.dart';

class LanguageSplashScreen extends StatefulWidget {
  const LanguageSplashScreen({super.key});

  @override
  State<LanguageSplashScreen> createState() => _LanguageSplashScreenState();
}

class _LanguageSplashScreenState extends State<LanguageSplashScreen>
    with SingleTickerProviderStateMixin {
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
          decoration: const BoxDecoration(color: AppTheme.shifaPrimaryColor),
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
                Text(
                  "WELCOME TO SHIFA HOSPITAL",
                  style: TextStyles.nexaRegular
                      .copyWith(color: AppTheme.whiteColor, fontSize: 16),
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
                        Text(
                          "Please, Select your preferred language",
                          style: TextStyles.nexaRegular.copyWith(
                            fontSize: 16,
                            color: AppTheme.blackColor,
                          ),
                        ),
                        const SizedBox(height: 21),
                        LanguageButton(
                          language: "English",
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, AppRoutes.onboardingScreen);
                          },
                        ),
                        const SizedBox(height: 16),
                        LanguageButton(
                          language: "العربية",
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, AppRoutes.onboardingScreen);
                          },
                        ),
                        const SizedBox(height: 32),
                        CustomGreenButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, AppRoutes.onboardingScreen);
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
