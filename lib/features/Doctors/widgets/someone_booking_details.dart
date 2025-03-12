import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/theme.dart';
import '../../../core/utils/validators.dart';
import '../../../core/widgtes/form_fields/custom_date_field.dart';
import '../../../core/widgtes/form_fields/custom_text_field.dart';
import '../../../core/widgtes/form_fields/phone_number_field.dart';

class SomeoneBookingDetails extends StatefulWidget {
  const SomeoneBookingDetails({super.key});

  @override
  State<SomeoneBookingDetails> createState() => _SomeoneBookingDetailsState();
}

class _SomeoneBookingDetailsState extends State<SomeoneBookingDetails> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool isValid = true;
  String? selectedGender = "male";
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return FormBuilder(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTextField(
            labelText: 'Your Name',
            name: 'name',
            isRequired: true,
            hintText: 'Enter your name',
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
          SizedBox(height: 16.h),
          CustomDateField(
            name: 'date',
            inputType: InputType.date,
            labelText: 'Date of birth',
          ),
          SizedBox(height: 16.h),
          Text(
            "Gender",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppTheme.primaryTextColor,
            ),
          ),
          SizedBox(
            height: 40.h,
            child: Row(
              children: <Widget>[
                Flexible(
                  child: RadioListTile<String>(
                    title: const Text('Male'),
                    value: 'male',
                    contentPadding: EdgeInsets.zero,
                    groupValue: selectedGender,
                    activeColor: themeProvider
                        .currentThemeData!.primaryColor,
                    onChanged: (String? value) {
                      setState(() {
                        selectedGender = value;
                      });
                    },
                  ),
                ),
                Flexible(
                  child: RadioListTile<String>(
                    title: const Text('Female'),
                    value: 'female',
                    contentPadding: EdgeInsets.zero,
                    groupValue: selectedGender,
                    activeColor: themeProvider
                        .currentThemeData!.primaryColor,
                    onChanged: (String? value) {
                      setState(() {
                        selectedGender = value;
                      });
                    },
                  ),
                ),
                //
              ],
            ),
          ),
        ],
      ),
    );
  }
}
