import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/theme.dart';
import 'package:provider/provider.dart';
class UserNameAndPhoneNumber extends StatelessWidget {
  const UserNameAndPhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      width: 327.w,
      decoration: BoxDecoration(
        color: AppTheme.secondaryColorLeksell,
        borderRadius: BorderRadius.circular(8.r),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ahmed Salah",
            style: TextStyle(
              fontSize: 16.sp,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            '+201098362091',
            style: TextStyle(
              color: themeProvider.currentThemeData!.primaryColor,
              fontSize: 16.sp,
            ),
          )
        ],
      ),
    );
  }
}
