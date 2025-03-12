import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/appbar_widget.dart';
import 'package:shifa/core/widgtes/common_app_bar_child_theme.dart';
import 'package:shifa/core/widgtes/form_fields/custom_text_field.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return CommonAppBar(
      alignment: Alignment.center,
      backGroundColor: themeProvider.currentThemeData!.primaryColor,
      hasBorderRadius: true,
      height: 253,
      appBarChild: CommonAppBarChildTheme(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello, Ahmed",
              style: TextStyles.nexaBold.copyWith(
                fontSize: 24.sp,
                color: AppTheme.whiteColor,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              "How are you Today",
              style: TextStyles.nexaRegular.copyWith(
                fontSize: 16.sp,
                color: AppTheme.whiteColor,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextField(
              name: "Search Doctor...",
              labelText: "Search Doctor...",
              hasName: false,
              hintText: "Search Doctor...",
              fillColor: AppTheme.whiteColor.withOpacity(0.4),
              hintTextColor: AppTheme.whiteColor,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  SVGAssets.search,
                  width: 20,
                  height: 20,
                  color: AppTheme.whiteColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
