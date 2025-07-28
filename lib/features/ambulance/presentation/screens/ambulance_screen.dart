import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/network/injection_container.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/widgtes/custom_snackbar.dart';
import 'package:shifa/features/ambulance/data/models/ambulance_request_model.dart';
import 'package:shifa/features/ambulance/presentation/managers/ambulance_cubit.dart';
import 'package:shifa/features/ambulance/presentation/managers/ambulance_state.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgtes/common_app_bar_title.dart';
import '../../../../core/widgtes/custom_green_button.dart';
import '../../../../core/widgtes/form_fields/custom_text_field.dart';
import '../../../../core/widgtes/form_fields/phone_number_field.dart';
import '../../../../core/widgtes/watermark_widget.dart';

class AmbulanceScreen extends StatefulWidget {
  const AmbulanceScreen({super.key});

  @override
  State<AmbulanceScreen> createState() => _AmbulanceScreenState();
}

class _AmbulanceScreenState extends State<AmbulanceScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool isValid = true;
  final TextEditingController phoneController = TextEditingController();

  final TextEditingController buildingController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController floorController = TextEditingController();
  final TextEditingController patientController = TextEditingController();
  final TextEditingController conditionController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  Key _formContentKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return WaterMark(
      appBarChild: CommonAppBarTitle(title: context.tr.translate('ambulance')),
      height: 105,
      alignment: Alignment.bottomCenter,
      backGroundColor: themeProvider.currentThemeData!.primaryColor,
      hasBorderRadius: false,
      contentChild: Expanded(
          child: BlocProvider(
        create: (context) => sl<AmbulanceCubit>(),
        child: BlocConsumer<AmbulanceCubit, AmbulanceState>(
          listener: (context, state) {
            if (state is AmbulanceSuccess) {
              showCustomSnackBar(context, state.response.message, isError: false);
              clearAllControllers();
            } else if (state is AmbulanceFailure) {
              showCustomSnackBar(context, state.message, isError: true, statusCode: state.statusCode);
            }
          },
          builder: (context, state) {
            return state is AmbulanceLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: themeProvider.currentThemeData!.primaryColor,
                    ),
                  )
                : FormBuilder(
                    key: _formKey,
                    child: Column(
                      key: _formContentKey,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 34.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Text(
                            context.tr.translate('ambulance_info_message'),
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
                                  CustomTextField(
                                    labelText: context.tr.translate('building_number'),
                                    name: 'building',
                                    controller: buildingController,
                                    isRequired: true,
                                    key: ValueKey('building-${_formContentKey.hashCode}'),
                                    // Add unique key
                                    onChanged: (value) {
                                      buildingController.text = value ?? '';
                                    },
                                    textInputType: TextInputType.number,
                                    hintText: context.tr.translate('building_number_hint'),
                                  ),
                                  SizedBox(height: 24.h),
                                  CustomTextField(
                                    labelText: context.tr.translate('address_details'),
                                    name: 'address',
                                    key: ValueKey('address-${_formContentKey.hashCode}'),
                                    // Add unique key

                                    isRequired: true,
                                    onChanged: (value) {
                                      addressController.text = value ?? '';
                                    },
                                    controller: addressController,
                                    hintText: context.tr.translate('address_details_hint'),
                                  ),
                                  SizedBox(height: 24.h),
                                  CustomTextField(
                                    labelText: context.tr.translate('floor_number'),
                                    name: 'floor',
                                    isRequired: true,
                                    key: ValueKey('floor-${_formContentKey.hashCode}'),
                                    // Add unique key

                                    controller: floorController,
                                    onChanged: (value) {
                                      floorController.text = value ?? '';
                                    },
                                    textInputType: TextInputType.number,
                                    hintText: context.tr.translate('floor_number_hint'),
                                  ),
                                  SizedBox(height: 24.h),
                                  CustomTextField(
                                    labelText: context.tr.translate('patient_name'),
                                    name: 'patient',
                                    key: ValueKey('patient-${_formContentKey.hashCode}'),
                                    // Add unique key

                                    isRequired: true,
                                    controller: patientController,
                                    onChanged: (value) {
                                      patientController.text = value ?? '';
                                    },
                                    hintText: context.tr.translate('patient_name_hint'),
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
                                  CustomTextField(
                                    labelText: context.tr.translate('patient_condition'),
                                    name: 'condition',
                                    controller: conditionController,
                                    key: ValueKey('condition-${_formContentKey.hashCode}'),
                                    // Add unique key

                                    isRequired: true,
                                    onChanged: (value) {
                                      conditionController.text = value ?? '';
                                    },
                                    hintText: context.tr.translate('patient_condition_hint'),
                                  ),
                                  SizedBox(height: 24.h),
                                  CustomTextField(
                                    labelText: context.tr.translate('additional_notes'),
                                    name: 'notes',
                                    key: ValueKey('notes-${_formContentKey.hashCode}'),
                                    // Add unique key

                                    onChanged: (value) {
                                      notesController.text = value ?? '';
                                    },
                                    controller: notesController,
                                    isRequired: false,
                                    hintText: context.tr.translate('additional_notes_hint'),
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
                            padding: EdgeInsets.only(right: 24.w, left: 24.w, top: 10.h, bottom: 40.h),
                            child: CustomGreenButton(
                              title: context.tr.translate('send_request'),
                              onPressed: state is AmbulanceLoading
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
                                        context.read<AmbulanceCubit>().requestAmbulance(
                                                request: AmbulanceRequestModel(
                                              buildingNumber: buildingController.text,
                                              addressDetails: addressController.text,
                                              floorNumber: floorController.text,
                                              patientName: patientController.text,
                                              phoneNumber: phoneController.text.replaceAll(" ", ""),
                                              patientConditionDescription: conditionController.text,
                                              additionalNotes: notesController.text,
                                            ));
                                        clearAllControllers();
                                      }
                                    },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
          },
        ),
      )),
    );
  }

  void clearAllControllers() {
    // Clear controller values
    patientController.clear();
    addressController.clear();
    phoneController.clear();
    floorController.clear();
    buildingController.clear();
    notesController.clear();
    conditionController.clear();

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
