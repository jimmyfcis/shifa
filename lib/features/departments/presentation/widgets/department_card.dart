import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/routes/app_routes.dart';
import 'package:shifa/features/departments/data/models/department_model.dart';

import '../../../../core/theme/styles.dart';
import '../../../../core/theme/theme.dart';

class DepartmentCard extends StatelessWidget {
  final DepartmentModel department;

  const DepartmentCard({
    super.key,
    required this.department,
  });

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final isArabic = locale.languageCode == 'ar';
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return InkWell(
      onTap: (){
        Navigator.pushNamed(
          context,
          AppRoutes.departmentDetails,
          arguments: {
            "department": department,
          },
        );
      },
      child: Card(
        color: AppTheme.whiteColor,
        margin: const EdgeInsets.only(bottom: 16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isArabic?department.titleAr??"":department.title ?? "",
                style: TextStyles.nexaRegular.copyWith(
                  color:themeProvider.currentThemeData!.primaryColor,
                  fontSize: 18.sp,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                isArabic?department.descriptionAr ?? "":department.description ?? "",
                style: TextStyles.nexaRegular.copyWith(
                  color: AppTheme.primaryTextColor,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
