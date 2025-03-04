import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shifa/core/models/blog_model.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';

class BlogCard extends StatelessWidget {
  final BlogModel blog;
  const BlogCard({
    super.key,
    required this.blog,
  });

  @override
  Widget build(BuildContext context) {
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
              child: Image.asset(
                blog.imageUrl,
                fit: BoxFit.fitHeight,
                width: 70.w,
                height: 70.h,
              ),
            ),
            SizedBox(
              width: 16.w,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    blog.title,
                    style: TextStyles.nexaBold.copyWith(
                      fontSize: 13.sp,
                      color: AppTheme.primaryTextColor,
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    blog.subTitle,
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
