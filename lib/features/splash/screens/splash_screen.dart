import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/theme.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/network/injection_container.dart';
import '../../../core/assets/svg/svg_assets.dart';
import '../../../core/storage/token_storage.dart';
import '../../authentication/presentation/cubit/login/login_cubit.dart';
import '../../authentication/presentation/cubit/login/login_state.dart';

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

    _fadeController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );

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
      body: BlocProvider(
        create: (context) => sl<AuthCubit>()..checkRememberAndLogin(context),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) async {
            if (state is AuthFailure) {
              final tokenStorage = TokenStorage();
              await Future.delayed(const Duration(seconds: 3));
              final goOnboarding = await tokenStorage.getOnboarding() ?? false;
              if (goOnboarding) {
                Navigator.pushReplacementNamed(context, AppRoutes.login);
              } else {
                Navigator.pushReplacementNamed(context, AppRoutes.languageSplash);
              }

            } else if (state is AuthSuccess) {
              Navigator.pushReplacementNamed(
                context,
                AppRoutes.bottomBar,
                arguments: {"index": 0},
              );
            }
          },
          builder: (context, state) {
            return FadeTransition(
              opacity: _fadeAnimation,
              child: Container(
                decoration: const BoxDecoration(
                  color: AppTheme.shifaPrimaryColor,
                ),
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
            );
          },
        ),
      ),
    );
  }
}
