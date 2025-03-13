import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/theme/theme.dart';

import '../../../core/theme/styles.dart';

class PaymentRadioGroup extends StatefulWidget {
  final int selectedPaymentMethod;
  final ThemeData themeData;
  final void Function(int?)? onChanged;
  const PaymentRadioGroup({super.key, required this.selectedPaymentMethod, required this.themeData, this.onChanged});

  @override
  State<PaymentRadioGroup> createState() => _PaymentRadioGroupState();
}

class _PaymentRadioGroupState extends State<PaymentRadioGroup> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select Payment Method:",
          style: TextStyles.nexaRegular.copyWith(
            fontSize: 16.sp,
            color: AppTheme.primaryTextColor,
          ),
        ),
        SizedBox(height:24.h),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: AppTheme.greyColor,
              width: 1,
            ),
          ),
          child: RadioListTile<int>(
            contentPadding: EdgeInsets.zero,
            title: Row(
              children: [
                Text(
                  "Cash at Hospital",
                  style: TextStyles.nexaRegular.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppTheme.primaryTextColor,
                    fontSize: 14.sp,
                  ),
                ),
                Spacer(),
                SvgPicture.asset(SVGAssets.cash,width: 24.w,height: 24.h,),
                SizedBox(width: 12.h),
              ],
            ),
            value: 0,
            activeColor: widget.themeData.primaryColor,
            groupValue: widget.selectedPaymentMethod,
            onChanged: widget.onChanged,
          ),
        ),
        SizedBox(height:16.h),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: AppTheme.greyColor,
              width: 1,
            ),
          ),
          child: RadioListTile<int>(
            contentPadding: EdgeInsets.zero,
            title: Row(
              children: [
                Text(
                  "Credit Card",
                  style: TextStyles.nexaRegular.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppTheme.primaryTextColor,
                    fontSize: 14.sp,
                  ),
                ),
                Spacer(),
                SvgPicture.asset(SVGAssets.creditCard,width: 24.w,height: 24.h,),
                SizedBox(width: 12.h),
              ],
            ),
            value: 1,
            activeColor: widget.themeData.primaryColor,
            groupValue: widget.selectedPaymentMethod,
            onChanged: widget.onChanged,
          ),
        ),
      ],
    );
  }
}
