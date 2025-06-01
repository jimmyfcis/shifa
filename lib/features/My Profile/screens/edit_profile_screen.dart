import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/assets/images/image_assets.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/routes/app_routes.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/utils/utils.dart';
import 'package:shifa/core/widgtes/common_app_bar_title.dart';
import 'package:shifa/core/widgtes/watermark_widget.dart';
import '../../../core/network/injection_container.dart';
import '../../../core/storage/token_storage.dart';
import '../../../core/utils/validators.dart';
import '../../../core/widgtes/custom_green_button.dart';
import '../../../core/widgtes/custom_snackbar.dart';
import '../../../core/widgtes/custom_white_button.dart';
import '../../../core/widgtes/form_fields/custom_date_field.dart';
import '../../../core/widgtes/form_fields/custom_drop_down_field.dart';
import '../../../core/widgtes/form_fields/custom_text_field.dart';
import '../../../core/widgtes/form_fields/email_text_field.dart';
import '../../../core/widgtes/form_fields/phone_number_field.dart';
import '../../authentication/data/models/user.dart';
import '../../authentication/presentation/cubit/login/login_cubit.dart';
import '../../authentication/presentation/cubit/login/login_state.dart';

class EditMyProfileScreen extends StatefulWidget {
  const EditMyProfileScreen({super.key});

  @override
  State<EditMyProfileScreen> createState() => _EditMyProfileScreenState();
}

class _EditMyProfileScreenState extends State<EditMyProfileScreen> {
  final TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();
  bool isValid = true;

  User? _user;

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }
  Future<void> _loadUserName() async {
    final storage = TokenStorage();
    final user = await storage.getUser();
      setState(() {
        _user = user;
      });

  }
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return WaterMark(
      backGroundColor: themeProvider.currentThemeData!.primaryColor,
      hasBorderRadius: false,
      height: 105,
      alignment: Alignment.bottomCenter,
      appBarChild: CommonAppBarTitle(
        title: context.tr.translate("edit_profile"),
      ),
      contentChild: Expanded(
        child: BlocProvider(
          create: (context) => sl<AuthCubit>(),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                showCustomSnackBar(context, context.tr.translate("edit_success"), isError: false);
                Navigator.pushReplacementNamed(context, AppRoutes.bottomBar, arguments: {
                  "index": 0,
                });
              }
              else if (state is AuthFailure) {
                if (state.message.isEmpty) {
                  showCustomSnackBar(context, context.tr.translate("error"), isError: true, statusCode: state.statusCode);
                }
                else {
                  showCustomSnackBar(context, state.message, isError: true, statusCode: state.statusCode);
                }
              }
            },
            builder: (context, state) {
              final loginCubit = context.read<AuthCubit>();
              return Column(
                children: [
                  SizedBox(height: 24.h),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppTheme.greyColor,
                          width: 1,
                        ),
                      ),
                      child: Image.asset(
                        ImageAssets.myProfileImg,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: FormBuilder(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextField(
                                labelText: context.tr.translate('your_name'),
                                name: 'name',
                                isRequired: true,
                                initialValue: _user?.name??"",
                                hintText: context.tr.translate('name_hint'),
                              ),
                              SizedBox(height: 16.h),
                              EmailTextField(
                                labelText: context.tr.translate('your_email'),
                                name: 'email',
                                isRequired: false,
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
                                isRequired: true,
                                initialValue: _user?.birthdate!=null && _user!.birthdate!.isNotEmpty?DateTime.parse(_user?.birthdate??""):null,
                                inputType: InputType.date,
                                labelText: context.tr.translate('date_of_birth'),
                              ),
                              SizedBox(height: 16.h),
                              CustomDropdownField(
                                name: 'gender',
                                isRequired: true,
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
                                labelText: context.tr.translate('id'),
                                name: 'id',
                                isRequired: true,
                                initialValue: _user?.id??"",
                                hintText: context.tr.translate('id_hint'),
                              ),
                              SizedBox(height: 24.h),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    color: AppTheme.whiteColor,
                    margin: EdgeInsets.zero,
                    shape: ContinuousRectangleBorder(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 24.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CustomWhiteButton(
                              title: context.tr.translate("Cancel"),
                              onPressed: () {
                                Navigator.pushNamed(context, AppRoutes.rateYourVisit);
                              },
                            ),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Expanded(
                            child: CustomGreenButton(
                              title: context.tr.translate("save_changes"),
                              fontSize: 14,
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
                                  final birthdate = Utils.formatDate(formValues['date']);
                                  final gender = Utils.formatGender(formValues['gender']);
                                  final user = User(
                                    name: formValues['name'] ?? '',
                                    nationalId: formValues['id'] ?? '',
                                    email: formValues['email'] ?? '',
                                    phoneNumber: phoneController.text.replaceAll(" ", ""),
                                    birthdate: birthdate,
                                    gender: gender,
                                    idType: formValues['id_type'] ?? '',
                                  );
                                  loginCubit.updateProfile(user: user);
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
