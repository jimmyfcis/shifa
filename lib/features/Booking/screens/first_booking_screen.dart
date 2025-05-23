import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/routes/app_routes.dart';
import 'package:shifa/core/widgtes/custom_green_button.dart';
import 'package:shifa/features/Doctors/widgets/booking_radio_steps.dart';
import '../../../core/models/doctor_model.dart';
import '../../../core/storage/token_storage.dart';
import '../../../core/theme/theme.dart';
import '../../../core/utils/validators.dart';
import '../../../core/widgtes/common_app_bar_title.dart';
import '../../../core/widgtes/form_fields/custom_text_field.dart';
import '../../../core/widgtes/form_fields/phone_number_field.dart';
import '../../../core/widgtes/watermark_widget.dart';
import '../../Doctors/widgets/booking_step_indicator.dart';
import '../../Doctors/widgets/my_self_booking_details.dart';

class FirstBookingScreen extends StatefulWidget {
  const FirstBookingScreen({super.key, required this.clinicID, required this.doctorId, required this.date, required this.time, required this.doctor});
  final String clinicID;
  final String doctorId;
  final String date;
  final String time;
  final Doctor doctor;

  @override
  State<FirstBookingScreen> createState() => _FirstBookingScreenState();
}

class _FirstBookingScreenState extends State<FirstBookingScreen> {
  int selectedStep = 0;

  final _formKey = GlobalKey<FormBuilderState>();
  bool isValid = true;
  final TextEditingController phoneController = TextEditingController();
  String _userName = '';
  String _phoneNumber = '';

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }
  Future<void> _loadUserName() async {
    final storage = TokenStorage();
    final user = await storage.getUser();
    if (mounted && user != null) {
      setState(() {
        _userName = user.name??"";
        _phoneNumber = user.phoneNumber??"";
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return WaterMark(
      backGroundColor: themeProvider.currentThemeData!.primaryColor,
      hasBorderRadius: false,
      alignment: Alignment.bottomCenter,
      height: 105.h,
      appBarChild:  CommonAppBarTitle(
        title: context.tr.translate("book_appointment"),
      ),
      contentChild: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 24.h, bottom: 0, right: 24.w, left: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BookingStepIndicator(
                      step: "Step 1", title: context.tr.translate("patient_details"), index: 0, themeProvider: themeProvider),
                  SizedBox(width: 8.w),
                  BookingStepIndicator(
                      step: "Step 2", title: context.tr.translate("appointment_details"), index: 1, themeProvider: themeProvider),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            BookingRadioSteps(
              selectedStep: selectedStep,
              themeData: themeProvider.currentThemeData!,
              onChanged: (value) {
                setState(() {
                  selectedStep = value!;
                });
              },
            ),
            SizedBox(height: 20.h),
            Expanded(child: SingleChildScrollView(child: _buildStepContent())),
            Card(
              color: AppTheme.whiteColor,
              elevation: 0,
              margin: EdgeInsets.zero,
              shape: const ContinuousRectangleBorder(),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 24.w,vertical: 10.h),
                child: CustomGreenButton(
                  onPressed: (){
                    if(selectedStep==0)
                      {
                        Navigator.pushNamed(context, AppRoutes.secondBookingScreen,
                            arguments: {
                              "clinicID": widget.clinicID,
                              "date": widget.date,
                              "doctorId": widget.doctorId,
                              "time": widget.time,
                              "name": _userName,
                              "mobile": _phoneNumber,
                              "doctor": widget.doctor,
                            });
                      }
                    else {
                      var formState = _formKey.currentState;
                      if (formState == null) return;
                      if (!formState.saveAndValidate()) {
                        return;
                      }
                      if (phoneController.text.isEmpty) {
                        setState(() {
                          isValid = false;
                        });
                      } else if (isValid && phoneController.text.isNotEmpty) {
                        final formValues = formState.value;
                        Navigator.pushNamed(context, AppRoutes.secondBookingScreen,
                            arguments: {
                              "clinicID": widget.clinicID,
                              "date": widget.date,
                              "doctorId": widget.doctorId,
                              "time": widget.time,
                              "name": formValues['name'],
                              "doctor": widget.doctor,
                              "mobile":phoneController.text.trim().replaceAll(" ", ""),
                            });
                      }
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepContent() {
    switch (selectedStep) {
      case 0:
        return Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24.w),
          child: const MySelfBookingDetails(),
        );
      case 1:
        return Padding(
          padding:EdgeInsets.symmetric(horizontal: 16.w),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 CustomTextField(
                  labelText: context.tr.translate("name"),
                  name: 'name',
                  isRequired: true,
                  hintText: context.tr.translate('name_hint'),
                ),
                SizedBox(height: 16.h),
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
              ],
            ),
          ),
        );
      default:
        return Container();
    }
  }
}
