import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shifa/core/utils/app_constants.dart';
import 'package:shifa/core/utils/enums.dart';
import 'package:shifa/core/widgtes/no_record_widget.dart';
import 'package:shifa/core/widgtes/reminders_card.dart';

class RemindersBody extends StatelessWidget {
  final String icon;
  final String noRecordTitle;
  final String cardTitle;
  final ReminderType reminderType;

  const RemindersBody({
    super.key,
    required this.icon,
    required this.noRecordTitle,
    required this.cardTitle,
    required this.reminderType,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: AppConstants().recordsList.isEmpty
            ? NoRecordWidget(
                icon: icon,
                title: noRecordTitle,
              )
            : ListView.separated(
                padding: EdgeInsets.zero,
                separatorBuilder: (context, index) => SizedBox(
                  height: 16.h,
                ),
                itemCount: 5,
                itemBuilder: (context, index) => RemindersCard(
                  leadingIcon: icon,
                  title: cardTitle,
                  reminderType: reminderType,
                ),
              ),
      ),
    );
  }
}
