import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    SVGAssets.onBoardingThird,
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _skip() {
    _pageController.animateToPage(2, curve: Curves.easeIn, duration: Duration(seconds: 1)); // Jump to the last page
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
                index: index,
                image: images[index],
                title: "Your Health, Our Priority",
                content: "Quickly find the right doctor and book your appointment in seconds.",
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
                          color: AppTheme.darkGreyColor,
                          fontSize: 14),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
          if (_currentPage == 2) // Show "Get Started" button only on the last page
            Positioned(
              bottom: 40.h,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Center(
                  child: CustomGreenButton(
                    title: "Get Started",
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, AppRoutes.login);
                    },
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPage({required String title, required String content, required String image, required int index}) {
    if (index == 3) {
      return Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                Navigator.pushReplacementNamed(context, AppRoutes.login);
              },
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: AppTheme.greyColor), borderRadius: BorderRadius.circular(12.r)),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 24.0.w),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        SVGAssets.splashIcon,
                        color: AppTheme.primaryColor,
                        width: 90.w,
                        height: 90.h,
                      ),
                      SizedBox(width: 12.w),
                      SvgPicture.asset(SVGAssets.shifaText),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 40.h),
            InkWell(
              onTap: (){
                Navigator.pushReplacementNamed(context, AppRoutes.login);
              },
              child: Container(
                decoration:
                BoxDecoration(border: Border.all(color: AppTheme.greyColor), borderRadius: BorderRadius.circular(12.r)),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 24.0.w),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        SVGAssets.leksellIcon,
                      ),
                      SizedBox(width: 10.w),
                      Container(width: 1.w,height:73.h,color: AppTheme.primaryColorLeksell,),
                      SizedBox(width: 12.w),
                      SvgPicture.asset(SVGAssets.leksellSplashText,width: 137.45.w,height: 66.48.h,),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
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
                    color: AppTheme.primaryTextColor,
                    fontSize: 24),
              ),
              SizedBox(height: 12.h),
              Text(
                content,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: FontsAssets.Nexa,
                    color: AppTheme.secondaryTextColor,
                    fontSize: 14),
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) => _buildStepIndicator(index)),
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget _buildStepIndicator(int index) {
    return _currentPage == index
        ? Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: 24.w,
            height: 6.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0.r),
              color: AppTheme.primaryColor,
            ),
          )
        : Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: 6.w,
            height: 6.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.leksellSecondaryColor,
            ),
          );
  }
}
