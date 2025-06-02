import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/routes/app_routes.dart';

import '../../../core/assets/svg/svg_assets.dart';
import '../../../core/network/injection_container.dart';
import '../../../core/storage/token_storage.dart';
import '../../../core/theme/styles.dart';
import '../../../core/theme/theme.dart';
import '../../../core/widgtes/custom_green_button.dart';
import '../../authentication/presentation/cubit/login/login_cubit.dart';
import '../../authentication/presentation/cubit/login/login_state.dart';

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
                    child: Text(
                      context.tr.translate('skip'),
                      style: TextStyles.nexaRegular.copyWith(color: AppTheme.darkGreyColor, fontSize: 14),
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
                    title: context.tr.translate('get_started'),
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
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    if (index == 3) {
      return Padding(
        padding: const EdgeInsets.all(24.0),
        child: BlocProvider(
          create: (context) => sl<AuthCubit>(),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthFailure) {
                Navigator.pushNamed(context, AppRoutes.login);
              } else if (state is AuthSuccess) {
                Navigator.pushReplacementNamed(context, AppRoutes.bottomBar, arguments: {
                  "index": 0,
                });
              }
            },
            builder: (context, state) {
              final loginCubit = context.read<AuthCubit>();
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      final TokenStorage tokenStorage = TokenStorage();
                      bool? isRemember = await tokenStorage.getRemember() ?? false;
                      final user = await tokenStorage.getUser();
                      final password = await tokenStorage.getPassword();
                      themeProvider.changeTheme(ThemeEnum.shifa);
                      if (isRemember &&
                          user != null &&
                          user.phoneNumber != null &&
                          user.phoneNumber!.isNotEmpty &&
                          password != null &&
                          password.isNotEmpty) {
                        loginCubit.login(
                          user.phoneNumber!,
                          password,
                        );
                      } else {
                        Navigator.pushNamed(context, AppRoutes.login);
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: AppTheme.greyColor), borderRadius: BorderRadius.circular(12.r)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 24.0.w),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              SVGAssets.splashIcon,
                              color: AppTheme.shifaPrimaryColor,
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
                  GestureDetector(
                    onTap: () {
                      themeProvider.changeTheme(ThemeEnum.leksell);
                      Navigator.pushNamed(context, AppRoutes.login);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: AppTheme.greyColor), borderRadius: BorderRadius.circular(12.r)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 24.0.w),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              SVGAssets.leksellIcon,
                            ),
                            SizedBox(width: 10.w),
                            Container(
                              width: 1.w,
                              height: 73.h,
                              color: AppTheme.shifaPrimaryColor,
                            ),
                            SizedBox(width: 12.w),
                            SvgPicture.asset(
                              SVGAssets.leksellSplashText,
                              width: 137.45.w,
                              height: 66.48.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
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
                style: TextStyles.nexaRegular.copyWith(color: AppTheme.primaryTextColor, fontSize: 24),
              ),
              SizedBox(height: 12.h),
              Text(
                content,
                textAlign: TextAlign.center,
                style: TextStyles.nexaRegular.copyWith(color: AppTheme.secondaryTextColor, fontSize: 14),
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
              color: AppTheme.shifaPrimaryColor,
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
