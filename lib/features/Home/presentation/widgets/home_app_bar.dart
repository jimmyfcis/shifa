import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/appbar_widget.dart';
import 'package:shifa/core/widgtes/common_app_bar_child_theme.dart';
import '../../../../core/storage/token_storage.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  String _userName = '';

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    final storage = TokenStorage();
    final user = await storage.getUser();
    if (mounted && user != null) {
      setState(() {
        _userName = user.name??"";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return CommonAppBar(
      alignment: Alignment.center,
      backGroundColor: themeProvider.currentThemeData!.primaryColor,
      hasBorderRadius: true,
      height: 200,
      appBarChild: CommonAppBarChildTheme(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${context.tr.translate("hello")} $_userName",
              style: TextStyles.nexaBold.copyWith(
                fontSize: 24.sp,
                color: AppTheme.whiteColor,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              context.tr.translate("how_are_you_today"),
              style: TextStyles.nexaRegular.copyWith(
                fontSize: 16.sp,
                color: AppTheme.whiteColor,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            // CustomTextField(
            //   name: "Search",
            //   labelText: context.tr.translate("search_doctor"),
            //   hasName: false,
            //   hintText: context.tr.translate("search_doctor"),
            //   fillColor: AppTheme.whiteColor.withOpacity(0.4),
            //   hintTextColor: AppTheme.whiteColor,
            //   prefixIcon: Padding(
            //     padding: const EdgeInsets.all(10.0),
            //     child: SvgPicture.asset(
            //       SVGAssets.search,
            //       width: 20,
            //       height: 20,
            //       color: AppTheme.whiteColor,
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
