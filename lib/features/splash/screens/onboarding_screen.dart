import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shifa/core/routes/app_routes.dart';

import '../../../core/assets/svg/assets.dart';
import '../../../core/theme/theme.dart';
import '../../../core/utils/fonts/fonts_manager.dart';
import '../../../core/widgtes/custom_green_button.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<String> images = [
    SVGAssets.onBoardingFirst,
    SVGAssets.onBoardingSecond,
    SVGAssets.onBoardingThird,
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _skip() {
    _pageController.jumpToPage(2); // Jump to the last page
  }

  void _getStarted() {
    Navigator.pushReplacementNamed(context, '/home'); // Example route
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.onBoardingBG,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return _buildPage(
                image: images[index],
                title: "Your Health, Our Priority",
                content:
                    "Quickly find the right doctor and book your appointment in seconds.",
              );
            },
          ),
          Positioned(
            top: 40,
            right: 20,
            child: _currentPage < 2
                ? TextButton(
                    onPressed: _skip,
                    child: const Text(
                      "Skip",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: FontsAssets.Nexa,
                          color: AppTheme.primaryColor,
                          fontSize: 14),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
          if (_currentPage ==
              2) // Show "Get Started" button only on the last page
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Center(
                  child: CustomGreenButton(
                    title: "Get Started",
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, AppRoutes.home);
                    },
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPage(
      {required String title, required String content, required String image}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(image),
            Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: FontsAssets.Nexa,
                  color: AppTheme.primaryColor,
                  fontSize: 24),
            ),
            const SizedBox(height: 12),
            Text(
              content,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: FontsAssets.Nexa,
                  color: AppTheme.primaryColor,
                  fontSize: 14),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) => _buildStepIndicator(index)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepIndicator(int index) {
    return _currentPage == index
        ? Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: 24,
            height: 6,
            decoration: const BoxDecoration(
              color: AppTheme.primaryColor,
            ),
          )
        : Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.primaryColor,
            ),
          );
  }
}
