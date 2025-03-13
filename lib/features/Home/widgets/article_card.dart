import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shifa/core/assets/images/image_assets.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppTheme.whiteColor,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: AppTheme.greyColor,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Image.asset(
              ImageAssets.articleImg,
              width: 70.w,
              height: 70.h,
              fit: BoxFit.fitHeight,
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  "The 25 Healthiest Fruits You Can Eat, According to a Nutritionist",
                  style: TextStyles.nexaBold.copyWith(
                    fontSize: 13.sp,
                    color: AppTheme.primaryTextColor,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  " is simply dummy text of the printing and typesetting industry.",
                  style: TextStyles.nexaRegular.copyWith(
                    fontSize: 11.sp,
                    color: AppTheme.secondaryTextColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
