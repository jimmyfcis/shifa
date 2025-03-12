import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/styles.dart';

class BookingRadioSteps extends StatefulWidget {
  final int selectedStep;
  final ThemeData themeData;
  final void Function(int?)? onChanged;

  const BookingRadioSteps({
    super.key,
    required this.selectedStep,
    required this.themeData,
    this.onChanged,
  });

  @override
  State<BookingRadioSteps> createState() => _BookingRadioStepsState();
}

class _BookingRadioStepsState extends State<BookingRadioSteps> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RadioListTile<int>(
            contentPadding: EdgeInsets.zero,
            title: Text(
              "Book for myself",
              style: TextStyles.nexaRegular.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
              ),
            ),
            value: 0,
            activeColor: widget.themeData.primaryColor,
            groupValue: widget.selectedStep,
            onChanged: widget.onChanged,
          ),
        ),
        Expanded(
          child: RadioListTile<int>(
            contentPadding: EdgeInsets.zero,
            title: Text(
              "Book for someone else",
              style: TextStyles.nexaRegular.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
              ),
            ),
            value: 1,
            activeColor: widget.themeData.primaryColor,
            groupValue: widget.selectedStep,
            onChanged: widget.onChanged,
          ),
        ),
      ],
    );
  }
}
