import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/appbar_widget.dart';
import 'package:shifa/core/widgtes/common_app_bar_child_theme.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return CommonAppBar(
      alignment: Alignment.center,
      backGroundColor: themeProvider.currentThemeData!.primaryColor,
      hasBorderRadius: true,
      height: 148,
      appBarChild: const CommonAppBarChildTheme(title: 'Profile'),
    );
  }
}
