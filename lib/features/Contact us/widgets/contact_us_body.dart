import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/network/injection_container.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/custom_green_button.dart';
import 'package:shifa/core/widgtes/form_fields/custom_text_field.dart';
import 'package:shifa/core/widgtes/form_fields/phone_number_field.dart';
import 'package:shifa/features/Contact%20us/presentation/cubit/contact_us_cubit.dart';
import 'package:shifa/features/Contact%20us/presentation/cubit/contact_us_state.dart';

import '../../../core/utils/validators.dart';
import '../../../core/widgtes/custom_snackbar.dart';
import '../../../core/widgtes/form_fields/email_text_field.dart';
import 'contact_us_item.dart';

class ContactUsBody extends StatefulWidget {
  const ContactUsBody({super.key});

  @override
  State<ContactUsBody> createState() => _ContactUsBodyState();
}

class _ContactUsBodyState extends State<ContactUsBody> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  bool isValid = true;
  
  // Add a unique key for the form
  final _formKey = GlobalKey<FormBuilderState>();
  // Add a key to force rebuild
  Key _formContentKey = UniqueKey();

  @override
  void dispose() {
    phoneController.dispose();
    nameController.dispose();
    emailController.dispose();
    subjectController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocProvider(
        create: (context) => sl<ContactUsCubit>(),
        child: BlocConsumer<ContactUsCubit, ContactUsState>(
          listener: (context, state) {
            if (state is ContactUsSuccess) {
              showCustomSnackBar(context, state.response.message, isError: false );
              clearAllControllers();
            } else if (state is ContactUsFailure) {
              showCustomSnackBar(context, state.message, isError: true,statusCode: state.statusCode);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: FormBuilder(
                  key: _formKey,
                  child: Column(
                    key: _formContentKey, // Add key to force rebuild
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        context.tr.translate('contact_us'),
                        style: TextStyles.nexaBold.copyWith(
                          fontSize: 18.sp,
                          color: AppTheme.blackColor,
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      ContactUsItem(
                        icon: SVGAssets.location,
                        title: context.tr.translate('location'),
                        subtitle: context.tr.translate('location_subtitle'),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      ContactUsItem(
                        icon: SVGAssets.call,
                        title: context.tr.translate('phone'),
                        subtitle: context.tr.translate('phone_subtitle'),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      ContactUsItem(
                        icon: SVGAssets.email,
                        title: context.tr.translate('email'),
                        subtitle: context.tr.translate('email_subtitle'),
                      ),
                      SizedBox(height: 16.h),
                      const Divider(color: AppTheme.greyColor),
                      SizedBox(height: 24.h),
                      Text(
                        context.tr.translate('get_in_touch'),
                        style: TextStyles.nexaBold.copyWith(
                          fontSize: 18.sp,
                          color: AppTheme.blackColor,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      CustomTextField(
                        name: "name", 
                        labelText: context.tr.translate('name'),
                        hintText: context.tr.translate('name_hint'),
                        key: ValueKey('name-${_formContentKey.hashCode}'), // Add unique key
                        initialValue: "",  // Force empty initialValue
                        isRequired: true,
                        onChanged: (value) {
                          nameController.text = value ?? '';
                        },
                      ),
                      SizedBox(height: 16.h),
                      EmailTextField(
                        name: "email", 
                        labelText: context.tr.translate('email_field'),
                        key: ValueKey('email-${_formContentKey.hashCode}'), // Add unique key
                        initialValue: "",  // Force empty initialValue 
                        isRequired: true,
                        onChanged: (value) {
                          emailController.text = value ?? '';
                        },
                      ),
                      SizedBox(height: 16.h),
                      PhoneNumberField(
                        controller: phoneController,
                        isValid: isValid,
                        onInputChanged: (PhoneNumber number) {
                          setState(() {
                            isValid = Validators()
                                .isValidEgyptianPhoneNumber(number.phoneNumber ?? "");
                          });
                        },
                      ),
                      SizedBox(height: 16.h),
                      CustomTextField(
                        name: "subject", 
                        labelText: context.tr.translate('subject'),
                        hintText: context.tr.translate('subject_hint'),
                        key: ValueKey('subject-${_formContentKey.hashCode}'), // Add unique key
                        initialValue: "",  // Force empty initialValue
                        onChanged: (value) {
                          subjectController.text = value ?? '';
                        },
                      ),
                      SizedBox(height: 16.h),
                      CustomTextField(
                        name: "message", 
                        labelText: context.tr.translate('message'),
                        hintText: context.tr.translate('message_hint'),
                        key: ValueKey('message-${_formContentKey.hashCode}'), // Add unique key
                        maxLines: 7,
                        isRequired: true,
                        initialValue: "",  // Force empty initialValue
                        onChanged: (value) {
                          messageController.text = value ?? '';
                        },
                      ),
                      SizedBox(height: 16.h),
                      CustomGreenButton(
                        title: state is ContactUsLoading 
                            ? context.tr.translate('sending')
                            : context.tr.translate('send_message'),
                        onPressed: state is ContactUsLoading
                            ? null
                            : () {
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
                              context.read<ContactUsCubit>().sendContactForm(
                                name: nameController.text,
                                email: emailController.text,
                                message: messageController.text,
                               phone: phoneController.text.replaceAll(" ", ""),
                                subject: subjectController.text,
                              );
                              clearAllControllers();
                           }
                        },
                      ),
                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void clearAllControllers() {
    // Clear controller values
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    subjectController.clear();
    messageController.clear();
    
    // Reset form state
    _formKey.currentState?.reset();
    
    // Set initialValue of all fields to empty by regenerating the form key
    // This forces the form to rebuild with empty values
    setState(() {
      _formContentKey = UniqueKey();
    });
    
    // Schedule a rebuild after the frame to ensure text fields update
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {});
    });
  }
}
