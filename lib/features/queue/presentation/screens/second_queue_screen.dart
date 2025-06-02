import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/features/queue/data/models/tickets_response.dart';
import '../../../../core/theme/theme.dart';
import '../../../../core/widgtes/common_app_bar_title.dart';
import '../../../../core/widgtes/watermark_widget.dart';

class SecondQueueScreen extends StatefulWidget {
  final List<Ticket> tickets;
  const SecondQueueScreen({super.key, required this.tickets});

  @override
  State<SecondQueueScreen> createState() => _SecondQueueScreenState();
}

class _SecondQueueScreenState extends State<SecondQueueScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool isValid = true;
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return WaterMark(
      appBarChild: CommonAppBarTitle(title: context.tr.translate('queue')),
      height: 105,
      alignment: Alignment.bottomCenter,
      backGroundColor: themeProvider.currentThemeData!.primaryColor,
      hasBorderRadius: false,
      contentChild: Expanded(
          child: FormBuilder(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 34.h),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal:24.w),
                  child: Text(
                    context.tr.translate('queue_for'),
                    style: TextStyles.nexaRegular.copyWith(
                      color: AppTheme.grey5Color,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppTheme.whiteColor,
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(color: AppTheme.greyColor, width: 1),
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(vertical: 14.0.h,horizontal: 12.w),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset("assets/svg/icons/docpng.png"),
                                  const SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        context.tr.translate('doctor_name'),
                                        style: TextStyles.nexaBold.copyWith(
                                          fontWeight: FontWeight.w900,
                                          color: AppTheme.primaryTextColor,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        context.tr.translate('doctor_specialty'),
                                        style: TextStyles.nexaRegular.copyWith(
                                          color: AppTheme.secondaryTextColor,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 24.h),
                          Text(
                            context.tr.translate('queue_number_is'),
                            style: TextStyles.nexaBold.copyWith(
                              color: AppTheme.grey5Color,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Container(
                            decoration: BoxDecoration(
                              color:  AppTheme.whiteColor,
                              borderRadius: BorderRadius.circular(16.r),
                              border: Border.all(color: themeProvider.currentThemeData!.primaryColor, width: 1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color:  themeProvider.currentThemeData!.primaryColor,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 29.5.h,horizontal: 26.w),
                                  child: Text(
                                    "12",
                                    style: TextStyles.nexaBold.copyWith(
                                      color: AppTheme.whiteColor,
                                      fontSize: 48.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 24.h),
                          Text(
                            context.tr.translate('arrival_confirmation'),
                            style: TextStyles.nexaRegular.copyWith(
                              color: AppTheme.grey5Color,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "${context.tr.translate('note')}: ",
                                  style: TextStyles.nexaRegular.copyWith(
                                    color: themeProvider.currentThemeData!.primaryColor,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                TextSpan(
                                  text: context.tr.translate('clinic_arrival_note'),
                                  style: TextStyles.nexaRegular.copyWith(
                                    color: AppTheme.grey5Color,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
