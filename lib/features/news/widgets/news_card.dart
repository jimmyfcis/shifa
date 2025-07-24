import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/assets/images/image_assets.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/utils/utils.dart';
import 'package:shifa/features/news/data/models/news_model.dart';


class NewsCard extends StatelessWidget {
  final NewsItem newsItem;

  const NewsCard({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    final locale = Localizations.localeOf(context);
    final isArabic = locale.languageCode == 'ar';
    final paragraph = Utils.extractTextFromHTML(isArabic?newsItem.descriptionAr??"":newsItem.descriptionEn??"");


    return Container(
      padding: const EdgeInsets.all(16.0),
      width: 327.w,
      height: 94.h,
      decoration: BoxDecoration(
        color: AppTheme.whiteColor,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: AppTheme.greyColor,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: newsItem.imageUrl != null && newsItem.imageUrl!.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: newsItem.imageUrl!,
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
              children: [
                Text(
                  isArabic ? newsItem.titleAr ?? "" : newsItem.titleEn ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.nexaBold.copyWith(
                    fontSize: 13.sp,
                    color: AppTheme.primaryTextColor,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Expanded(
                  child: Text(
                    paragraph,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.nexaRegular.copyWith(
                      fontSize: 11.sp,
                      color: AppTheme.secondaryTextColor,
                    ),
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
