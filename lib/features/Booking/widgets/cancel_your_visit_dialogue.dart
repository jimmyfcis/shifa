import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/widgtes/custom_green_button.dart';
import 'package:shifa/core/widgtes/custom_white_button.dart';
import 'package:shifa/core/widgtes/form_fields/custom_text_field.dart';
import 'package:shifa/features/Booking/data/models/appointment_model.dart';
import 'package:shifa/features/Booking/data/models/cancel_appointment_model.dart';
import 'package:shifa/features/Booking/presentation/cubit/cancel_appointment_cubit.dart';
import '../../../core/network/injection_container.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/theme/styles.dart';
import '../../../core/theme/theme.dart';
import '../../../core/widgtes/custom_snackbar.dart';

class CancelYourVisitDialogue extends StatefulWidget {
  const CancelYourVisitDialogue({
    super.key,
    required this.themeProvider, required this.appointment,
  });

  final ThemeProvider themeProvider;
  final Appointment appointment;

  @override
  State<CancelYourVisitDialogue> createState() => _CancelYourVisitDialogueState();
}

class _CancelYourVisitDialogueState extends State<CancelYourVisitDialogue> {
  String reason = "";
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppTheme.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r), // Rounded corners
      ),
      child: BlocProvider(
        create: (context) => sl<CancelAppointmentCubit>(),
        child: BlocConsumer<CancelAppointmentCubit, CancelAppointmentState>(
          listener: (context, state) {
            if (state is CancelAppointmentError) {
              showCustomSnackBar(context, state.message, isError: true, statusCode: state.statusCode);
            } else if (state is CancelAppointmentSuccess) {
              Navigator.pushReplacementNamed(context, AppRoutes.bottomBar, arguments: {
                "index": 1,
              });
            }
          },
          builder: (context, state) {
            ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
            final cubit = context.read<CancelAppointmentCubit>();
            return Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: FormBuilder(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            context.tr.translate('cancel_visit'),
                            style: TextStyles.nexaBold.copyWith(
                              color: AppTheme.primaryTextColor,
                              fontSize: 20.sp,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            context.tr.translate('cancel_visit_confirm'),
                            textAlign: TextAlign.center,
                            style: TextStyles.nexaRegular.copyWith(
                              color: AppTheme.secondaryTextColor,
                              fontSize: 17.sp,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          CustomTextField(
                            name: "reason",
                            labelText: "",
                            isRequired: true,
                            onChanged: (text) {
                              setState(() {
                                reason = text ?? "";
                              });
                            },
                            hintText: context.tr.translate("reason"),
                          ),
                          SizedBox(height: 24.h),
                          state is CancelAppointmentLoading
                              ? Center(
                              child: CircularProgressIndicator(
                                color: themeProvider.currentThemeData!.primaryColor,
                              ))
                              : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: CustomWhiteButton(
                                  title: context.tr.translate('no'),
                                  borderColor: AppTheme.secondaryTextColor,
                                  textColor: AppTheme.secondaryTextColor,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              Expanded(
                                child: CustomGreenButton(
                                  title: context.tr.translate('yes_cancel'),
                                  fontSize: 14,
                                  backGroundColor: AppTheme.redColor,
                                  borderColor: AppTheme.redColor,
                                  onPressed: () {
                                    var formState = _formKey.currentState;
                                    if (formState == null) return;
                                    if (!formState.saveAndValidate()) {
                                      return;
                                    }
                                    cubit.cancelAppointment(cancelAppointmentRequest: CancelAppointmentRequest(appointmentID: widget.appointment.appointmentID??"", reason: reason,));
                                  },
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
