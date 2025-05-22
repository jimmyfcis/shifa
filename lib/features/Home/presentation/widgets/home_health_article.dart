import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';

import 'article_card.dart';

class HomeHealthArticle extends StatelessWidget {
  const HomeHealthArticle({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.tr.translate('health_article'),
                style: TextStyles.nexaBold.copyWith(
                  fontSize: 16.sp,
                  color: AppTheme.textBlackColor,
                ),
              ),
              Text(
                context.tr.translate("see_all"),
                style: TextStyles.nexaRegular.copyWith(
                  fontSize: 12.sp,
                  color: themeProvider.currentTheme == ThemeEnum.shifa
                      ? AppTheme.green5Color
                      : AppTheme.leksellPrimaryColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        SizedBox(
          height: 125.h,
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(width: 16.w),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) => const ArticleCard(),
          ),
        ),
      ],
    );
  }
}
