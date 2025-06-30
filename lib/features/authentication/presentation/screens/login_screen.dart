import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/theme/theme.dart';
import '../../../../core/assets/svg/svg_assets.dart';
import '../../../../core/network/injection_container.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/storage/token_storage.dart';
import '../../../../core/theme/styles.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgtes/auth_appbar.dart';
import '../../../../core/widgtes/custom_green_button.dart';
import '../../../../core/widgtes/custom_snackbar.dart';
import '../../../../core/widgtes/form_fields/password_text_field.dart';
import '../../../../core/widgtes/form_fields/phone_number_field.dart';
import '../cubit/login/login_cubit.dart';
import '../cubit/login/login_state.dart';
import '../../../../core/localization/app_extensions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool isValid = true;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController controller = TextEditingController();
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            showCustomSnackBar(context, state.message, isError: true,statusCode: state.statusCode);
          } else if (state is AuthSuccess) {
            Navigator.pushReplacementNamed(context, AppRoutes.bottomBar, arguments: {
              "index": 0,
            });
          }
        },
        builder: (context, state) {
          final loginCubit = context.read<AuthCubit>();

          return AuthAppbar(
            showBack: false,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SvgPicture.asset(
                    themeProvider.currentTheme == ThemeEnum.shifa
                        ? SVGAssets.shifaIconText
                        : SVGAssets.leksellAuth,
                  ),
                  SizedBox(height: 42.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: state is AuthLoading
                        ? Center(child: CircularProgressIndicator(color: themeProvider.currentThemeData!.primaryColor,))
                        : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.tr.translate('welcome_back'),
                          style: TextStyles.nexaBold.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primaryTextColor,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          context.tr.translate('login_message'),
                          softWrap: true,
                          style: TextStyles.nexaRegular.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppTheme.grey5Color,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 32.h),
                        PhoneNumberField(
                          controller: phoneController,
                          isValid: isValid,
                          labelText: context.tr.translate('phone_number'),
                          onInputChanged: (PhoneNumber number) {
                            setState(() {
                              isValid = Validators()
                                  .isValidEgyptianPhoneNumber(number.phoneNumber ?? "");
                            });
                          },
                        ),
                        FormBuilder(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(height: 24.h),
                              PasswordTextField(
                                labelText: context.tr.translate('password'),
                                name: 'password',
                                controller: controller,
                                isRequired: true,
                                hintText: context.tr.translate('password_hint'),
                              ),
                              SizedBox(height: 16.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: _rememberMe,
                                        onChanged: (value) async{
                                          setState(() {
                                            _rememberMe = value ?? false;
                                          });
                                          final TokenStorage storage = TokenStorage();
                                          await storage.saveRemember(_rememberMe);
                                        },
                                        activeColor: themeProvider.currentThemeData!.primaryColor,
                                      ),
                                      Text(
                                        context.tr.translate('remember_me'),
                                        style: TextStyles.nexaRegular.copyWith(
                                          color: AppTheme.primaryTextColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, AppRoutes.forgetPassword);
                                    },
                                    child: Text(
                                      context.tr.translate('forgot_password'),
                                      style: TextStyles.nexaRegular.copyWith(
                                        color: themeProvider.currentThemeData!.primaryColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 34.h),
                              CustomGreenButton(
                                title: context.tr.translate('login'),
                                onPressed: () async{
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
                                    loginCubit.login(
                                      phoneController.text.trim().replaceAll(" ", ""),
                                      controller.text.trim(),
                                    );
                                  }
                                },
                              ),
                              // SizedBox(height: 24.h),
                              // Row(
                              //   crossAxisAlignment: CrossAxisAlignment.end,
                              //   children: [
                              //     const Expanded(child: Divider()),
                              //     Padding(
                              //       padding: const EdgeInsets.symmetric(horizontal: 6.0),
                              //       child: Text(
                              //         context.tr.translate('or_signup_with'),
                              //         style: TextStyles.nexaRegular.copyWith(
                              //           color: AppTheme.blackColor,
                              //           fontSize: 12,
                              //           fontWeight: FontWeight.w400,
                              //         ),
                              //       ),
                              //     ),
                              //     const Expanded(child: Divider()),
                              //   ],
                              // ),
                              // SizedBox(height: 24.h),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: [
                              //     SvgPicture.asset(SVGAssets.google),
                              //     SizedBox(width: 24.w),
                              //     SvgPicture.asset(SVGAssets.facebook),
                              //     SizedBox(width: 24.w),
                              //     SvgPicture.asset(SVGAssets.apple),
                              //   ],
                              // ),
                              SizedBox(height: 24.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    context.tr.translate('no_account'),
                                    style: TextStyles.nexaRegular.copyWith(
                                      color: AppTheme.primaryTextColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, AppRoutes.register);
                                    },
                                    child: Text(
                                      context.tr.translate('create_account'),
                                      style: TextStyles.nexaRegular.copyWith(
                                        color: themeProvider.currentThemeData!.primaryColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
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
    phoneController.dispose();
    controller.dispose();
    super.dispose();
  }
}
