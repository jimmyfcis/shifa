import 'package:flutter/material.dart';
import '../../../../core/theme/theme.dart';
import '../../../core/assets/svg/assets.dart';
import '../../../core/routes/app_routes.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
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

    // Delay for 5 seconds, then navigate to the next screen
    Future.delayed(const Duration(seconds: 3)).then((val) {
      Navigator.pushReplacementNamed(context, AppRoutes.languageSplash);
    });
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
          child: Hero(
            tag: "logo",
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(SVGAssets.splashIcon),
                  SvgPicture.asset(SVGAssets.splashTexts),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
