import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shifa/core/assets/svg/assets.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';

import 'contact_us_item.dart';

class ContactUsBody extends StatelessWidget {
  const ContactUsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 24.h,
          ),
          Text(
            "Contact Us",
            style: TextStyles.nexaBold.copyWith(
              fontSize: 18.sp,
              color: AppTheme.blackColor,
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          const ContactUsItem(
            icon: SVGAssets.location,
            title: "Cairo, Egypt",
            subtitle: "The 5th Settlement",
          ),
          SizedBox(
            height: 16.h,
          ),
          const ContactUsItem(
            icon: SVGAssets.call,
            title: "15051",
            subtitle: "Available 24/7",
          ),
          SizedBox(
            height: 16.h,
          ),
          const ContactUsItem(
            icon: SVGAssets.email,
            title: "info@shifaegypt.com",
            subtitle: "send us your query anytime!",
          ),
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
    );
  }
}
