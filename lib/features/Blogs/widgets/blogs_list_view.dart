import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shifa/core/routes/app_routes.dart';
import 'package:shifa/core/utils/app_constants.dart';
import 'package:shifa/features/Blogs/widgets/blog_card.dart';

class BlogsList extends StatelessWidget {
  const BlogsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: AppConstants().blogsList.length,
        separatorBuilder: (context, index) => SizedBox(
          height: 16.h,
        ),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.blogDetails,
                arguments: AppConstants().blogsList[index]);
          },
          child: BlogCard(
            blog: AppConstants().blogsList[index],
          ),
        ),
      ),
    );
  }
}
