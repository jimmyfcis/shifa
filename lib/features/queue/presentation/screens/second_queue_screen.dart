import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/features/queue/data/models/tickets_response.dart';
import '../../../../core/theme/theme.dart';
import '../../../../core/widgtes/common_app_bar_title.dart';
import '../../../../core/widgtes/empty_state.dart';
import '../../../../core/widgtes/watermark_widget.dart';

class SecondQueueScreen extends StatefulWidget {
  final List<Ticket> tickets;
  const SecondQueueScreen({super.key, required this.tickets});

  @override
  State<SecondQueueScreen> createState() => _SecondQueueScreenState();
}

class _SecondQueueScreenState extends State<SecondQueueScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    
    return WaterMark(
      appBarChild: CommonAppBarTitle(title: context.tr.translate('queue')),
      height: 105,
      alignment: Alignment.bottomCenter,
      backGroundColor: themeProvider.currentThemeData!.primaryColor,
      hasBorderRadius: false,
      contentChild: Expanded(
        child: widget.tickets.isEmpty?EmptyStateWidget(
          message: context.tr.translate('no_visits'),
        ):ListView.builder(
          padding: EdgeInsets.all(16.r),
          itemCount: widget.tickets.length,
          itemBuilder: (context, index) {
            final ticket = widget.tickets[index];
            return Card(
              color: AppTheme.whiteColor,
              margin: EdgeInsets.only(bottom: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16.h),
                    _buildInfoRow(
                      context.tr.translate('ticket_number'),
                      ticket.ticket ?? '',
                      color: themeProvider.currentThemeData!.primaryColor,
                    ),
                    SizedBox(height: 8.h),
                    _buildInfoRow(
                        context.tr.translate('doctor_name'),
                        ticket.doctorName ?? '',
                        color: themeProvider.currentThemeData!.primaryColor,
                    ),
                    SizedBox(height: 8.h),
                    _buildInfoRow(
                      context.tr.translate('current_ticket'),
                      ticket.currentTicket ?? '',
                    ),
                    SizedBox(height: 8.h),
                    _buildInfoRow(
                      context.tr.translate('clinic_number'),
                      ticket.clinicNo ?? '',
                    ),
                    SizedBox(height: 8.h),
                    _buildInfoRow(
                      context.tr.translate('day_name'),
                      isArabic ? ticket.dayNameAr ?? '' : ticket.dayNameEn ?? '',
                    ),
                    SizedBox(height: 8.h),
                    _buildInfoRow(
                      context.tr.translate('time_start'),
                      ticket.timeStart ?? '',
                    ),
                    SizedBox(height: 8.h),
                    _buildInfoRow(
                      context.tr.translate('time_end'),
                      ticket.timeEnd ?? '',
                    ),
                    SizedBox(height: 8.h),
                    _buildInfoRow(
                      context.tr.translate('status'),
                      ticket.status ?? '',
                      color: themeProvider.currentThemeData!.primaryColor,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value,{Color? color}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyles.nexaRegular.copyWith(
            fontSize: 14.sp,
            color: AppTheme.grey5Color,
          ),
        ),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: TextStyles.nexaBold.copyWith(
              fontSize: 14.sp,
              color: color??AppTheme.primaryTextColor,
            ),
          ),
        ),
      ],
    );
  }
}
