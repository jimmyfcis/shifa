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
               showCustomSnackBar(context, state.message, isError: true);
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
                          "Create Account",
                          style: TextStyles.nexaRegular
                              .copyWith(fontWeight: FontWeight.bold, color: AppTheme.blackColor, fontSize: 24),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "Sign up now and start exploring what our app has to offer. We are excited to welcome you to our community.",
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
                            const CustomTextField(
                              labelText: 'Your Name',
                              name: 'name',
                              isRequired: true,
                              hintText: 'Enter your name',
                            ),
                            SizedBox(height: 16.h),
                            const EmailTextField(
                              labelText: 'Your Email',
                              name: 'email',
                              isRequired: true,
                              hintText: 'Enter your email',
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
                              isRequired: false,
                              inputType: InputType.date,
                              labelText: 'Date of birth',
                            ),
                            SizedBox(height: 16.h),
                            const CustomTextField(
                              labelText: 'Your Martial Status',
                              name: 'martial',
                              isRequired: false,
                              hintText: 'Enter your martial status',
                            ),
                            SizedBox(height: 16.h),
                            CustomDropdownField(
                              name: 'religion',
                              isRequired: false,
                              labelText: 'Your Religion',
                              items: ["Muslim", "Christian", "Jewish"],
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
                              labelText: 'Your Gender',
                              items: ["Male", "Female"],
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
                            const CustomTextField(
                              labelText: 'Your Age',
                              name: 'age',
                              isRequired: false,
                              textInputType: TextInputType.number,
                              hintText: 'Enter your age',
                            ),
                            SizedBox(height: 16.h),
                            const CustomTextField(
                              labelText: 'Your Medical Company',
                              name: 'company',
                              isRequired: false,
                              hintText: 'Enter your medical company',
                            ),
                            SizedBox(height: 16.h),
                            const CustomTextField(
                              labelText: 'Your ID',
                              name: 'id',
                              isRequired: true,
                              hintText: 'Enter your id',
                            ),
                            SizedBox(height: 16.h),
                            CustomDropdownField(
                              name: 'id_type',
                              isRequired: true,
                              labelText: 'ID type',
                              items: ["National ID", "Passport"],
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
                            const CustomTextField(
                              labelText: 'Your Address',
                              name: 'address',
                              isRequired: false,
                              hintText: 'Enter your address',
                            ),
                            SizedBox(height: 16.h),
                            const CustomTextField(
                              labelText: 'Your City',
                              name: 'city',
                              isRequired: false,
                              hintText: 'Enter your city',
                            ),
                            SizedBox(height: 16.h),
                            const CustomTextField(
                              labelText: 'Your Area',
                              name: 'area',
                              isRequired: false,
                              hintText: 'Enter your area',
                            ),
                            SizedBox(height: 16.h),
                            const CustomTextField(
                              labelText: 'Your Street',
                              name: 'street',
                              isRequired: false,
                              hintText: 'Enter your street',
                            ),
                            SizedBox(height: 16.h),
                            const CustomTextField(
                              labelText: 'Your Building number',
                              name: 'building',
                              isRequired: false,
                              textInputType: TextInputType.number,
                              hintText: 'Enter your Building number',
                            ),
                            SizedBox(height: 16.h),
                            PasswordTextField(
                              labelText: 'Password',
                              name: 'password',
                              isRequired: true,
                              controller: passwordController,
                              hintText: 'Enter your Password',
                            ),
                            SizedBox(height: 16.h),
                            ConfirmPasswordTextField(
                                labelText: "Confirm password",
                                name: "confirm",
                                isRequired: true,
                                hintText: 'Enter your Password',
                                passwordController: passwordController),
                            SizedBox(height: 34.h),
                            CustomGreenButton(
                              title: "Create Account",
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
                                    phone: phoneController.text.replaceAll(" ", ""),
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
                                    'or signup with',
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
                                          text: 'by signing up you agree to our ',
                                          style: TextStyles.nexaRegular.copyWith(
                                            // color: AppTheme.grey6Color,
                                            color: AppTheme.primaryTextColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Terms & Conditions ',
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.pushNamed(context, AppRoutes.termsAndConditions);
                                            },
                                          style: TextStyles.nexaRegular.copyWith(
                                            color: AppTheme.primaryTextColor,
                                            //color: AppTheme.grey6Color,
                                            fontSize: 12,
                                            decoration: TextDecoration.underline,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'and ',
                                          style: TextStyles.nexaRegular.copyWith(
                                            color: AppTheme.primaryTextColor,
                                            // color: AppTheme.grey6Color,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Privacy Policy',
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.pushNamed(context, AppRoutes.privacyPolicy);
                                            },
                                          style: TextStyles.nexaRegular.copyWith(
                                            color: AppTheme.primaryTextColor,
                                            //color: AppTheme.grey6Color,
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
                                        text: 'Have an account?',
                                        style: TextStyles.nexaRegular.copyWith(
                                          color: AppTheme.primaryTextColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' Sign in',
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
