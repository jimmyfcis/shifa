import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/widgtes/custom_white_button.dart';
import 'package:shifa/core/widgtes/form_fields/custom_date_field.dart';
import 'package:shifa/core/widgtes/form_fields/custom_drop_down_field.dart';
import '../../../core/theme/styles.dart';
import '../../../core/theme/theme.dart';
import '../../../core/widgtes/common_app_bar_title.dart';
import '../../../core/widgtes/custom_green_button.dart';
import '../../../core/widgtes/form_fields/custom_text_field.dart';
import '../../../core/widgtes/watermark_widget.dart';

class NewMedicineReminderScreen extends StatefulWidget {
  const NewMedicineReminderScreen({super.key});

  @override
  State<NewMedicineReminderScreen> createState() => _NewMedicineReminderScreenState();
}

class _NewMedicineReminderScreenState extends State<NewMedicineReminderScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool isValid = true;
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return WaterMark(
      appBarChild: const CommonAppBarTitle(title: "New Reminder"),
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
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          const CustomTextField(
                            labelText: 'Medicine Name',
                            name: 'name',
                            isRequired: true,
                            textInputType: TextInputType.number,
                            hintText: 'enter Medicine name',
                          ),
                          SizedBox(height: 24.h),
                          CustomDropdownField(
                            name: 'dose',
                            isRequired: true,
                            labelText: 'Dose',
                            items: ["1","2","3","4","5"],
                            itemBuilder: (context, data) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  color: AppTheme.whiteColor,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data,
                                        style: TextStyles.nexaRegular.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: AppTheme.primaryTextColor,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 24.h),
                          CustomDropdownField(
                            name: 'times',
                            isRequired: true,
                            labelText: 'Times/Day',
                            items: ["1","2","3","4","5"],
                            itemBuilder: (context, data) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  color: AppTheme.whiteColor,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data,
                                        style: TextStyles.nexaRegular.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: AppTheme.primaryTextColor,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 24.h),
                          CustomDropdownField(
                            name: 'long',
                            isRequired: true,
                            labelText: 'How long?',
                            items: ["1","2","3","4","5"],
                            itemBuilder: (context, data) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  color: AppTheme.whiteColor,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data,
                                        style: TextStyles.nexaRegular.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: AppTheme.primaryTextColor,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 24.h),
                          const CustomDateField(
                            labelText: 'Starting from',
                            name: 'date',
                            isRequired: true,
                          ),
                          SizedBox(height: 24.h),
                          const CustomDateField(
                            labelText: 'Reminder Time',
                            name: 'time',
                            isRequired: true,
                            hintText: "00:00",
                            inputType: InputType.time,
                          ),
                          SizedBox(height: 24.h),
                          const CustomTextField(
                            labelText: 'Doctor who prescribed it',
                            name: 'doctor',
                            isRequired: true,
                            hintText: 'doctor name',
                          ),
                          SizedBox(height: 24.h),
                          const CustomTextField(
                            labelText: 'Additional notes',
                            name: 'notes',
                            isRequired: true,
                            maxLines: 3,
                            hintText: 'Enter Additional notes',
                          ),
                          SizedBox(height: 24.h),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  color: AppTheme.whiteColor,
                  elevation: 0,
                  margin: EdgeInsets.zero,
                  shape: const ContinuousRectangleBorder(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomWhiteButton(
                            title: 'Cancel',
                            onPressed: (){
                              Navigator.pop(context);
                            },),
                        ),
                        SizedBox(width: 16.h),
                        Expanded(
                          child: CustomGreenButton(
                            title: "Add",
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
