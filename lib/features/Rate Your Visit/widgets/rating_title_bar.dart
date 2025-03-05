import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/theme/styles.dart';

class RatingTitleBar extends StatelessWidget {
  final String title;

  const RatingTitleBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.nexaBold.copyWith(
            fontSize: 12.sp,
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        RatingBar.builder(
            initialRating: 0,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemSize: 24,
            itemCount: 5,
            itemPadding: EdgeInsets.only(right: 8.w),
            itemBuilder: (context, _) => SvgPicture.asset(
                  SVGAssets.star,
                  width: 24.w,
                  height: 24.h,
                ),
            onRatingUpdate: (rating) {
              print(rating);
            })
      ],
    );
  }
}
