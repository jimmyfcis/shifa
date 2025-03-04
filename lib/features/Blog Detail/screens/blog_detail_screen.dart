import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/models/blog_model.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/utils/app_constants.dart';
import 'package:shifa/core/widgtes/common_app_bar_title.dart';
import 'package:shifa/core/widgtes/watermark_widget.dart';

// ... Previous imports and code

class BlogDetailScreen extends StatelessWidget {
  final BlogModel blog;
  const BlogDetailScreen({
    super.key,
    required this.blog,
  });

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return WaterMark(
      alignment: Alignment.bottomCenter,
      hasBorderRadius: false,
      appBarChild: CommonAppBarTitle(title: "Blog Details"),
      height: 105,
      backGroundColor: themeProvider.currentThemeData!.primaryColor,
      contentChild: Expanded(
        child: Stack(
          children: [
            Image.asset(
              blog.imageUrl,
              width: 375.w,
              height: 320.h,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 290.h, // Start below the image
              bottom: 0, // Extend to the bottom of the screen
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppTheme.whiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        blog.title,
                        style: TextStyles.nexaBold.copyWith(
                            fontSize: 18.sp, color: AppTheme.primaryTextColor),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        AppConstants.lognText,
                        style: TextStyles.nexaRegular.copyWith(
                          color: AppTheme.secondaryTextColor,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(height: 12.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
