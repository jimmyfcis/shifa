import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/features/Blogs/data/models/blog_model.dart';

import '../../../core/assets/images/image_assets.dart';

class BlogCard extends StatelessWidget {
  final Blog blog;

  const BlogCard({
    super.key,
    required this.blog,
  });

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    final locale = Localizations.localeOf(context);
    final isArabic = locale.languageCode == 'ar';
    return Card(
      color: AppTheme.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
        side: const BorderSide(
          width: 1,
          color: AppTheme.greyColor,
        ),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: blog.image != null && blog.image!.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: blog.image!,
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(
                          color: themeProvider.currentThemeData!.primaryColor,
                        ), // Loading spinner
                      ),
                      width: 70.w,
                      height: 70.h,
                      fit: BoxFit.fill,
                    )
                  : Image.asset(
                      ImageAssets.blogImg1,
                      width: 70.w,
                      height: 70.h,
                      fit: BoxFit.fill,
                    ),
            ),
            SizedBox(
              width: 16.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isArabic ? blog.titleAr ?? "" : blog.titleEn ?? "",
                    style: TextStyles.nexaBold.copyWith(
                      fontSize: 13.sp,
                      color: AppTheme.primaryTextColor,
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    isArabic ? blog.descriptionAr ?? "" : blog.descriptionEn ?? "",
                    style: TextStyles.nexaRegular.copyWith(
                      fontSize: 11.sp,
                      color: AppTheme.secondaryTextColor,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
