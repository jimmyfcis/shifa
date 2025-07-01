import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/common_app_bar_title.dart';
import 'package:shifa/features/authentication/presentation/cubit/change%20password/change_password_cubit.dart';
import 'package:shifa/features/authentication/presentation/cubit/change%20password/change_password_state.dart';
import '../../../../core/network/injection_container.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/widgtes/custom_green_button.dart';
import '../../../../core/widgtes/custom_snackbar.dart';
import '../../../../core/widgtes/form_fields/password_text_field.dart';
import '../../../../core/widgtes/watermark_widget.dart';
import '../../../../core/localization/app_extensions.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final TextEditingController newController = TextEditingController();
  final TextEditingController oldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return BlocProvider(
      create: (context) => sl<ChangePasswordCubit>(),
      child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
        listener: (context, state) {
          if (state is ChangePasswordFailure) {
            showCustomSnackBar(context, state.message, isError: true, statusCode: state.statusCode);
          } else if (state is ChangePasswordSuccess) {
            showCustomSnackBar(context, state.forgetPasswordResponse.message??context.tr.translate("password_success"), isError: false);
            Navigator.pushReplacementNamed(context, AppRoutes.login);
          }
        },
        builder: (context, state) {
          final changePasswordCubit = context.read<ChangePasswordCubit>();
          return WaterMark(
            backGroundColor: themeProvider.currentThemeData!.primaryColor,
            hasBorderRadius: false,
            alignment: Alignment.bottomCenter,
            height: 105,
            appBarChild: CommonAppBarTitle(
              title: context.tr.translate("change_password"),
            ),
            contentChild: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 42.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: state is ChangePasswordLoading
                        ? Center(
                            child: CircularProgressIndicator(
                            color: themeProvider.currentThemeData!.primaryColor,
                          ))
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FormBuilder(
                                key: _formKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(height: 24.h),
                                    PasswordTextField(
                                      labelText: context.tr.translate('old_password'),
                                      name: 'old',
                                      controller: oldController,
                                      isRequired: true,
                                      hintText: context.tr.translate('password_hint'),
                                    ),
                                    SizedBox(height: 32.h),
                                    PasswordTextField(
                                      labelText: context.tr.translate('new_password'),
                                      name: 'new',
                                      controller: newController,
                                      isRequired: true,
                                      hintText: context.tr.translate('password_hint'),
                                    ),
                                    SizedBox(height: 34.h),
                                    CustomGreenButton(
                                      title: context.tr.translate('submit'),
                                      onPressed: () async {
                                        var formState = _formKey.currentState;
                                        if (formState == null) return;
                                        if (!formState.saveAndValidate()) {
                                          return;
                                        }
                                        changePasswordCubit.changePassword(
                                          newPassword: newController.text,
                                          currentPassword: oldController.text,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                  ),
                  SizedBox(height: 42.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    newController.dispose();
    oldController.dispose();
    super.dispose();
  }
}
