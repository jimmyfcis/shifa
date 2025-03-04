// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shifa/core/theme/styles.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double? fontSize;
  final Color buttonColor;
  final Color borderColor;
  final Color textColor;
  final String? title;
  final double? height;
  final double? borderRadius;
  final VoidCallback? onpress;
  final Widget? customWidget;
  final FontWeight fontWeight;

  const CustomButton({
    Key? key,
    required this.width,
    required this.buttonColor,
    required this.borderColor,
    required this.textColor,
    this.title = '',
    this.fontSize,
    this.borderRadius = 20,
    this.height,
    this.onpress,
    this.fontWeight = FontWeight.normal,
    this.customWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress ?? () {},
      child: Container(
        padding: const EdgeInsets.all(3),
        width: width,
        height: height ?? 40.h,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(borderRadius!),
          border: Border.all(
            color: borderColor,
            width: 1,
          ),
        ),
        child: Center(
            child: customWidget ??
                Text(
                  title ?? "",
                  style: TextStyles.nexaRegular.copyWith(
                    fontSize: fontSize ?? 15.sp,
                    color: textColor,
                    fontWeight: fontWeight,
                  ),
                )),
      ),
    );
  }
}
