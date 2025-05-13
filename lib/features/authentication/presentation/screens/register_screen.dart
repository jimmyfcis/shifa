import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/utils/validators.dart';
import 'package:shifa/features/authentication/data/models/user.dart';

import '../../../../core/assets/svg/svg_assets.dart';
import '../../../../core/network/injection_container.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/styles.dart';
import '../../../../core/widgtes/auth_appbar.dart';
import '../../../../core/widgtes/custom_green_button.dart';
import '../../../../core/widgtes/custom_snackbar.dart';
import '../../../../core/widgtes/form_fields/confirm_password_text_field.dart';
import '../../../../core/widgtes/form_fields/custom_date_field.dart';
import '../../../../core/widgtes/form_fields/custom_drop_down_field.dart';
import '../../../../core/widgtes/form_fields/custom_text_field.dart';
import '../../../../core/widgtes/form_fields/email_text_field.dart';
import '../../../../core/widgtes/form_fields/password_text_field.dart';
import '../../../../core/widgtes/form_fields/phone_number_field.dart';
import '../cubit/login/login_cubit.dart';
import '../cubit/login/login_state.dart';
import 'package:shifa/core/localization/app_extensions.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool isValid = true;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String formatDate(DateTime? date) {
    if (date == null) return '';
    return DateFormat('dd/MM/yyyy HH:mm:ss').format(date);
  }

  String formatGender(String? gender) {
    if (gender == null) return '';
    return gender.toLowerCase() == 'male' ? 'M' : 'F';
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
           if (state is AuthSuccess) {
            Navigator.pushReplacementNamed(context, AppRoutes.bottomBar);
          }
           else if (state is AuthFailure) {
             if(state.message.isEmpty)
               {
                 Navigator.pushReplacementNamed(context, AppRoutes.bottomBar);
               }
             else {
               showCustomSnackBar(context, state.message, isError: true,statusCode: state.statusCode);
             }
           }
        },
        builder: (context, state) {
          final loginCubit = context.read<AuthCubit>();
          return AuthAppbar(
            body: Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24, bottom: 60),
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    SvgPicture.asset(themeProvider.currentTheme == ThemeEnum.shifa
                        ? SVGAssets.shifaIconText
                        : SVGAssets.leksellAuth),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 42.h),
                        Text(
                          context.tr.translate('create_account'),
                          style: TextStyles.nexaRegular
                              .copyWith(fontWeight: FontWeight.bold, color: AppTheme.blackColor, fontSize: 24),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          context.tr.translate('sign_up_message'),
                          softWrap: true,
                          style: TextStyles.nexaRegular
                              .copyWith(fontWeight: FontWeight.w400, color: AppTheme.grey5Color, fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 32.h),
                            CustomTextField(
                              labelText: context.tr.translate('your_name'),
                              name: 'name',
                              isRequired: true,
                              hintText: context.tr.translate('name_hint'),
                            ),
                            SizedBox(height: 16.h),
                            EmailTextField(
                              labelText: context.tr.translate('your_email'),
                              name: 'email',
                              isRequired: true,
                              hintText: context.tr.translate('email_hint'),
                            ),
                            SizedBox(height: 16.h),
                            PhoneNumberField(
                              controller: phoneController,
                              isValid: isValid,
                              onInputChanged: (PhoneNumber number) {
                                setState(() {
                                  isValid = Validators().isValidEgyptianPhoneNumber(number.phoneNumber ?? "");
                                });
                                return;
                              },
                            ),
                            SizedBox(height: 16.h),
                            CustomDateField(
                              name: 'date',
                              isRequired: false,
                              inputType: InputType.date,
                              labelText: context.tr.translate('date_of_birth'),
                            ),
                            SizedBox(height: 16.h),
                            CustomTextField(
                              labelText: context.tr.translate('martial_status'),
                              name: 'martial',
                              isRequired: false,
                              hintText: context.tr.translate('martial_status_hint'),
                            ),
                            SizedBox(height: 16.h),
                            CustomDropdownField(
                              name: 'religion',
                              isRequired: false,
                              labelText: context.tr.translate('religion'),
                              items: [
                                context.tr.translate('muslim'), 
                                context.tr.translate('christian'), 
                                context.tr.translate('jewish')
                              ],
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
                            SizedBox(height: 16.h),
                            CustomDropdownField(
                              name: 'gender',
                              isRequired: false,
                              labelText: context.tr.translate('gender'),
                              items: [context.tr.translate('male'), context.tr.translate('female')],
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
                            SizedBox(height: 16.h),
                            CustomTextField(
                              labelText: context.tr.translate('age'),
                              name: 'age',
                              isRequired: false,
                              textInputType: TextInputType.number,
                              hintText: context.tr.translate('age_hint'),
                            ),
                            SizedBox(height: 16.h),
                            CustomTextField(
                              labelText: context.tr.translate('medical_company'),
                              name: 'company',
                              isRequired: false,
                              hintText: context.tr.translate('medical_company_hint'),
                            ),
                            SizedBox(height: 16.h),
                            CustomTextField(
                              labelText: context.tr.translate('id'),
                              name: 'id',
                              isRequired: true,
                              hintText: context.tr.translate('id_hint'),
                            ),
                            SizedBox(height: 16.h),
                            CustomDropdownField(
                              name: 'id_type',
                              isRequired: true,
                              labelText: context.tr.translate('id_type'),
                              items: [context.tr.translate('national_id'), context.tr.translate('passport')],
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
                            SizedBox(height: 16.h),
                            CustomTextField(
                              labelText: context.tr.translate('address'),
                              name: 'address',
                              isRequired: false,
                              hintText: context.tr.translate('address_hint'),
                            ),
                            SizedBox(height: 16.h),
                            CustomTextField(
                              labelText: context.tr.translate('city'),
                              name: 'city',
                              isRequired: false,
                              hintText: context.tr.translate('city_hint'),
                            ),
                            SizedBox(height: 16.h),
                            CustomTextField(
                              labelText: context.tr.translate('area'),
                              name: 'area',
                              isRequired: false,
                              hintText: context.tr.translate('area_hint'),
                            ),
                            SizedBox(height: 16.h),
                            CustomTextField(
                              labelText: context.tr.translate('street'),
                              name: 'street',
                              isRequired: false,
                              hintText: context.tr.translate('street_hint'),
                            ),
                            SizedBox(height: 16.h),
                            CustomTextField(
                              labelText: context.tr.translate('building_number'),
                              name: 'building',
                              isRequired: false,
                              textInputType: TextInputType.number,
                              hintText: context.tr.translate('building_number_hint'),
                            ),
                            SizedBox(height: 16.h),
                            PasswordTextField(
                              labelText: context.tr.translate('password'),
                              name: 'password',
                              isRequired: true,
                              controller: passwordController,
                              hintText: context.tr.translate('password_hint'),
                            ),
                            SizedBox(height: 16.h),
                            ConfirmPasswordTextField(
                                labelText: context.tr.translate('confirm_password'),
                                name: "confirm",
                                isRequired: true,
                                hintText: context.tr.translate('password_hint'),
                                passwordController: passwordController),
                            SizedBox(height: 34.h),
                            CustomGreenButton(
                              title: context.tr.translate('create_account'),
                              onPressed: () {
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
                                  final birthdate = formatDate(formValues['date']);
                                  final gender = formatGender(formValues['gender']);
                                  final user = User(
                                    name: formValues['name'] ?? '',
                                    nationalId: formValues['id'] ?? '',
                                    email: formValues['email'] ?? '',
                                    password: formValues['password'] ?? '',
                                    confirmPassword: formValues['confirm'] ?? '',
                                    phoneNumber: phoneController.text.replaceAll(" ", ""),
                                    maritalStatus: formValues['martial'] ?? '',
                                    birthdate: birthdate,
                                    religion: formValues['religion'] ?? '',
                                    gender: gender,
                                    age: int.parse(formValues['age'] ?? 0),
                                    medicalCompany: formValues['company'] ?? '',
                                    idType: formValues['id_type'] ?? '',
                                    address: formValues['address'] ?? '',
                                    city: formValues['city'] ?? '',
                                    area: formValues['area'] ?? '',
                                    street: formValues['street'] ?? '',
                                    buildingNumber: formValues['building']?.toString() ?? '',
                                  );
                                  loginCubit.register(user: user);
                                }
                              },
                            ),
                            SizedBox(height: 24.h),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(child: Divider()),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 6.0),
                                  child: Text(
                                    context.tr.translate('or_signup_with'),
                                    style: TextStyles.nexaRegular.copyWith(
                                      color: AppTheme.blackColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Expanded(child: Divider()),
                              ],
                            ),
                            SizedBox(height: 24.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(SVGAssets.google),
                                SizedBox(width: 24.w),
                                SvgPicture.asset(SVGAssets.facebook),
                                SizedBox(width: 24.w),
                                SvgPicture.asset(SVGAssets.apple),
                              ],
                            ),
                            SizedBox(height: 24.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: context.tr.translate('agree_to_terms_start'),
                                          style: TextStyles.nexaRegular.copyWith(
                                            color: AppTheme.primaryTextColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        TextSpan(
                                          text: context.tr.translate('terms_conditions'),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.pushNamed(context, AppRoutes.termsAndConditions);
                                            },
                                          style: TextStyles.nexaRegular.copyWith(
                                            color: AppTheme.primaryTextColor,
                                            fontSize: 12,
                                            decoration: TextDecoration.underline,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        TextSpan(
                                          text: context.tr.translate('and'),
                                          style: TextStyles.nexaRegular.copyWith(
                                            color: AppTheme.primaryTextColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        TextSpan(
                                          text: context.tr.translate('privacy_policy'),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.pushNamed(context, AppRoutes.privacyPolicy);
                                            },
                                          style: TextStyles.nexaRegular.copyWith(
                                            color: AppTheme.primaryTextColor,
                                            fontSize: 12,
                                            decoration: TextDecoration.underline,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 24.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: context.tr.translate('have_account'),
                                        style: TextStyles.nexaRegular.copyWith(
                                          color: AppTheme.primaryTextColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      TextSpan(
                                        text: context.tr.translate('sign_in'),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.pushReplacementNamed(context, AppRoutes.login);
                                          },
                                        style: TextStyles.nexaRegular.copyWith(
                                          color: themeProvider.currentThemeData!.primaryColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }
}
