import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/common_app_bar_title.dart';
import 'package:shifa/core/widgtes/watermark_widget.dart';
import 'package:shifa/features/Blogs/data/models/blog_model.dart';
import '../../../core/assets/images/image_assets.dart';

class BlogDetailScreen extends StatelessWidget {
  final Blog blog;
  const BlogDetailScreen({
    super.key,
    required this.blog,
  });

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    final locale = Localizations.localeOf(context);
    final isArabic = locale.languageCode == 'ar';
    return WaterMark(
      alignment: Alignment.bottomCenter,
      hasBorderRadius: false,
      appBarChild: CommonAppBarTitle(title: context.tr.translate("blog_details")),
      height: 105,
      backGroundColor: themeProvider.currentThemeData!.primaryColor,
      contentChild: Expanded(
        child: Stack(
          children: [
           blog.image!=null&& blog.image!.isNotEmpty?
           CachedNetworkImage(
            imageUrl:  blog.image!,
             placeholder: (context, url) => Center(
               child: CircularProgressIndicator(
                 color: themeProvider.currentThemeData!.primaryColor,
               ), // Loading spinner
             ),
             width: 375.w,
             height: 320.h,
             fit: BoxFit.fill,
           ): Image.asset(
             ImageAssets.blogImg1,
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
                        isArabic?blog.titleAr??"":blog.titleEn??"",
                        style: TextStyles.nexaBold.copyWith(
                            fontSize: 18.sp, color: AppTheme.primaryTextColor),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        isArabic?blog.descriptionAr??"":blog.descriptionEn??"",
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
