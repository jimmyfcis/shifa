import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/styles.dart';
import '../../../core/theme/theme.dart';
class TimeSlot extends StatelessWidget {
  final String time;
  final bool isSelected;

  const TimeSlot({
    super.key,
    required this.time,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      width: 156,
      height: 38,
      decoration: BoxDecoration(
        color: isSelected
            ? themeProvider.currentThemeData!.primaryColor
            : AppTheme.whiteColor,
        border: Border.all(color: AppTheme.greyColor),
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Center(
        child: Text(
          time,
          style: TextStyles.nexaRegular.copyWith(
            color: isSelected ? AppTheme.whiteColor : AppTheme.primaryTextColor,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}