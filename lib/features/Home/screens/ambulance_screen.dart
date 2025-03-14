import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/theme/styles.dart';
import '../../../core/theme/theme.dart';
import '../../../core/utils/validators.dart';
import '../../../core/widgtes/common_app_bar_title.dart';
import '../../../core/widgtes/custom_green_button.dart';
import '../../../core/widgtes/form_fields/custom_text_field.dart';
import '../../../core/widgtes/form_fields/phone_number_field.dart';
import '../../../core/widgtes/watermark_widget.dart';

class AmbulanceScreen extends StatefulWidget {
  const AmbulanceScreen({super.key});

  @override
  State<AmbulanceScreen> createState() => _AmbulanceScreenState();
}

class _AmbulanceScreenState extends State<AmbulanceScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool isValid = true;
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return WaterMark(
      appBarChild: const CommonAppBarTitle(title: "Ambulance"),
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
                "Send us your info and we will contact you soon.",
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
                      const CustomTextField(
                        labelText: 'Building number',
                        name: 'building',
                        isRequired: true,
                        textInputType: TextInputType.number,
                        hintText: 'Enter your address',
                      ),
                      SizedBox(height: 24.h),
                      const CustomTextField(
                        labelText: 'Address details',
                        name: 'address',
                        isRequired: true,
                        hintText: 'street name',
                      ),
                      SizedBox(height: 24.h),
                      const CustomTextField(
                        labelText: 'Floor number',
                        name: 'floor',
                        isRequired: true,
                        textInputType: TextInputType.number,
                        hintText: 'Enter your address',
                      ),
                      SizedBox(height: 24.h),
                      const CustomTextField(
                        labelText: 'Patient name',
                        name: 'patient',
                        isRequired: true,
                        hintText: 'Enter Patient name',
                      ),
                      SizedBox(height: 24.h),
                      PhoneNumberField(
                        controller: phoneController,
                        isValid: isValid,
                        onInputChanged: (PhoneNumber number) {
                          print(number.phoneNumber);
                          setState(() {
                            isValid = Validators().isValidEgyptianPhoneNumber(number.phoneNumber ?? "");
                          });
                          return;
                        },
                      ),
                      SizedBox(height: 24.h),
                      const CustomTextField(
                        labelText: 'Patient condition description',
                        name: 'condition',
                        isRequired: true,
                        hintText: 'Enter Patient condition',
                      ),
                      SizedBox(height: 24.h),
                      const CustomTextField(
                        labelText: 'Additional Notes',
                        name: 'condition',
                        isRequired: false,
                        hintText: 'Add any additional notes here',
                      ),
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
                child: CustomGreenButton(
                  title: "Send Request",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
