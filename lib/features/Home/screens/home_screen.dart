import 'package:flutter/material.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/features/Home/widgets/home_app_bar.dart';
import 'package:shifa/features/Home/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.profileBGColor,
      extendBodyBehindAppBar: true,
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeAppBar(),
          Expanded(
            child: HomeScreenBody(),
          ),
        ],
      ),
    );
  }
}
