// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:shifa/core/theme/theme.dart';
// import 'package:shifa/core/utils/validators.dart';
// import 'package:shifa/core/widgets/auth_appbar.dart';
// import 'package:shifa/core/widgets/custom_green_button.dart';
// import 'package:shifa/core/widgets/form_fields/confirm_password_field.dart';
// import 'package:shifa/core/widgets/form_fields/phone_field.dart';
// import '../../../../core/assets/svg/svg_assests.dart';
// import 'package:flutter_svg/svg.dart';
// import '../../../core/assets/svg/svg_assets.dart';
// import '../../../core/routes/app_routes.dart';
// import '../../../core/theme/styles.dart';
// import '../../../core/utils/fonts/fonts_manager.dart';
// import '../../../core/utils/theme_notifier.dart';
// import '../../../core/widgets/form_fields/custom_password_field.dart';
// import '../../../core/widgets/form_fields/custom_text_field.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';
// import '../../../core/widgets/form_fields/dropdown_field.dart';
// import '../../../core/widgets/form_fields/email_text_field.dart';
// import 'package:provider/provider.dart';
//
// import '../../../core/widgtes/custom_green_button.dart';
// import '../../../core/widgtes/form_fields/phone_number_field.dart';
// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({super.key});
//
//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }
//
// class _RegisterScreenState extends State<RegisterScreen> {
//   final _formKey = GlobalKey<FormBuilderState>();
//   bool isValid = true;
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
//     return AuthAppbar(
//       body: Padding(
//         padding: const EdgeInsets.only(left: 24.0,right: 24,bottom: 60),
//         child: FormBuilder(
//           key: _formKey,
//           child: Column(
//             children: [
//               SvgPicture.asset(themeProvider.currentTheme==ThemeEnum.Shifa?SVGAssets.shifaIconText:SVGAssets.leksellAuth),
//                Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 42),
//                   Text(
//                     "Create Account",
//                     style: TextStyles.nexaRegular.copyWith(
//                         fontWeight: FontWeight.bold,
//                         //fontFamily: FontsAssets.Nexa,
//                         color: AppTheme.blackColor,
//                         fontSize: 24),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     "Sign up now and start exploring what our app has to offer. We are excited to welcome you to our community.",
//                     softWrap: true,
//                     style: TextStyles.nexaRegular.copyWith(
//                         fontWeight: FontWeight.w400,
//                         color: AppTheme.grey5Color,
//                         fontSize: 12),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(height: 32),
//                       const CustomTextField(
//                         labelText: 'Your Name',
//                         name: 'name',
//                         hintText: 'Enter your name',
//                       ),
//                       const SizedBox(height: 16),
//                       const EmailTextField(
//                         labelText: 'Your Email',
//                         name: 'email',
//                         hintText: 'Enter your email',
//                       ),
//                       const SizedBox(height: 16),
//                       PhoneNumberField(
//                         controller: phoneController,
//                         isValid: isValid,
//                         onInputChanged: (PhoneNumber number) {
//                           print(number.phoneNumber);
//                           setState(() {
//                             isValid = Validators().isValidEgyptianPhoneNumber(number.phoneNumber ?? "");
//                           });
//                           return;
//                         },
//                       ),
//                       const SizedBox(height: 16),
//                       const CustomTextField(
//                         labelText: 'Your Martial Status',
//                         name: 'martial',
//                         hintText: 'Enter your martial status',
//                       ),
//                       const SizedBox(height: 16),
//                       CustomDropdownField(
//                         name: 'religion',
//                         isRequired: true,
//                         labelText: 'Your Religion',
//                         items: ["Muslim", "Christian", "Jewish"],
//                         itemBuilder: (context, data) {
//                           return Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Container(
//                               color: AppTheme.whiteColor,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     data,
//                                     style: const TextStyle(
//                                       fontWeight: FontWeight.w400,
//                                       fontFamily: FontsAssets.Nexa,
//                                       color: AppTheme.primaryText,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                       const SizedBox(height: 16),
//                       CustomDropdownField(
//                         name: 'gender',
//                         isRequired: true,
//                         labelText: 'Your Gender',
//                         items: ["Male", "Female"],
//                         itemBuilder: (context, data) {
//                           return Padding(
//                             padding: const EdgeInsets.all(8.0),                            child: Container(
//                             color: AppTheme.whiteColor,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   data,
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.w400,
//                                     fontFamily: FontsAssets.Nexa,
//                                     color: AppTheme.primaryText,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           );
//                         },
//                       ),
//                       const SizedBox(height: 16),
//                       const CustomTextField(
//                         labelText: 'Your Age',
//                         name: 'age',
//                         textInputType: TextInputType.number,
//                         hintText: 'Enter your age',
//                       ),
//                       const SizedBox(height: 16),
//                       const CustomTextField(
//                         labelText: 'Your Medical Company',
//                         name: 'company',
//                         hintText: 'Enter your medical company',
//                       ),
//                       const SizedBox(height: 16),
//                       const CustomTextField(
//                         labelText: 'Your ID',
//                         name: 'id',
//                         hintText: 'Enter your id',
//                       ),
//                       const SizedBox(height: 16),
//                       CustomDropdownField(
//                         name: 'id_type',
//                         isRequired: true,
//                         labelText: 'ID type',
//                         items: ["National ID", "Passport"],
//                         itemBuilder: (context, data) {
//                           return Padding(
//                             padding: const EdgeInsets.all(8.0),                            child: Container(
//                             color: AppTheme.whiteColor,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   data,
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.w400,
//                                     fontFamily: FontsAssets.Nexa,
//                                     color: AppTheme.primaryText,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           );
//                         },
//                       ),
//                       const SizedBox(height: 16),
//                       const CustomTextField(
//                         labelText: 'Your Address',
//                         name: 'address',
//                         hintText: 'Enter your address',
//                       ),
//                       const SizedBox(height: 16),
//                       const CustomTextField(
//                         labelText: 'Your City',
//                         name: 'city',
//                         hintText: 'Enter your city',
//                       ),
//                       const SizedBox(height: 16),
//                       const CustomTextField(
//                         labelText: 'Your Area',
//                         name: 'area',
//                         hintText: 'Enter your area',
//                       ),
//                       const SizedBox(height: 16),
//                       const CustomTextField(
//                         labelText: 'Your Street',
//                         name: 'street',
//                         hintText: 'Enter your street',
//                       ),
//                       const SizedBox(height: 16),
//                       const CustomTextField(
//                         labelText: 'Your Building number',
//                         name: 'building',
//                         textInputType: TextInputType.number,
//                         hintText: 'Enter your Building number',
//                       ),
//                       const SizedBox(height: 16),
//                       PasswordTextField(
//                         labelText: 'Password',
//                         name: 'password',
//                         controller: passwordController,
//                         hintText: 'Enter your Password',
//                       ),
//                       const SizedBox(height: 16),
//                       ConfirmPasswordTextField(
//                           labelText: "Confirm password",
//                           name: "confirm",
//                           hintText: 'Enter your Password',
//                           passwordController: passwordController),
//                       const SizedBox(height: 34),
//                       CustomGreenButton(
//                         title: "Create Account",
//                         onPressed: () {
//                           var formState = _formKey.currentState;
//                           if (formState == null) return;
//                           if (!formState.saveAndValidate()) {
//                             return;
//                           }
//                           if (isValid && phoneController.text.isNotEmpty) {
//                             Navigator.pushReplacementNamed(context, AppRoutes.home);
//                           } else {
//                             setState(() {
//                               isValid = false;
//                             });
//                           }
//                         },
//                       ),
//                       const SizedBox(height: 24),
//                        Row(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           Expanded(child: Divider()),
//                           Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 6.0),
//                             child: Text(
//                               'or signup with',
//                               style: TextStyles.nexaRegular.copyWith(
//                                 color: AppTheme.blackColor,
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                           ),
//                           Expanded(child: Divider()),
//                         ],
//                       ),
//                       const SizedBox(height: 24),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SvgPicture.asset(SVGAssets.google),
//                           const SizedBox(width: 24),
//                           SvgPicture.asset(SVGAssets.facebook),
//                           const SizedBox(width: 24),
//                           SvgPicture.asset(SVGAssets.apple),
//                         ],
//                       ),
//                       const SizedBox(height: 24),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Expanded(
//                             child: RichText(
//                               text: TextSpan(
//                                 children: [
//                                    TextSpan(
//                                     text: 'by signing up you agree to our ',
//                                     style: TextStyles.nexaRegular.copyWith(
//                                      // color: AppTheme.grey6Color,
//                                       color: Colors.yellow,
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                   TextSpan(
//                                     text: 'Terms & Conditions ',
//                                     recognizer: TapGestureRecognizer()
//                                       ..onTap = () {
//                                         Navigator.pushNamed(context, AppRoutes.termsAndConditions);
//                                       },
//                                     style:  TextStyles.nexaRegular.copyWith(
//                                       color: Colors.yellow,
//                                       //color: AppTheme.grey6Color,
//                                       fontSize: 12,
//                                       decoration: TextDecoration.underline,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                    TextSpan(
//                                     text: 'and ',
//                                     style: TextStyles.nexaRegular.copyWith(
//                                       color: Colors.yellow,
//                                      // color: AppTheme.grey6Color,
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                   TextSpan(
//                                     text: 'Privacy Policy',
//                                     recognizer: TapGestureRecognizer()
//                                       ..onTap = () {
//                                         Navigator.pushNamed(context, AppRoutes.privacyPolicy);
//                                       },
//                                     style:  TextStyles.nexaRegular.copyWith(
//                                       color: Colors.yellow,
//                                       //color: AppTheme.grey6Color,
//                                       fontSize: 12,
//                                       decoration: TextDecoration.underline,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 24),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           RichText(
//                             text: TextSpan(
//                               children: [
//                                  TextSpan(
//                                   text: 'Have an account?',
//                                   style: TextStyles.nexaRegular.copyWith(
//                                     color: AppTheme.primaryTextColor,
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                                 TextSpan(
//                                   text: ' Sign in',
//                                   recognizer: TapGestureRecognizer()
//                                     ..onTap = () {
//                                       Navigator.pushReplacementNamed(context, AppRoutes.login);
//                                     },
//                                   style: TextStyles.nexaRegular.copyWith(
//                                     color: themeProvider.currentThemeData!.primaryColor,
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       showSkip: true,
//     );
//   }
//
//   @override
//   void dispose() {
//     phoneController.dispose();
//     super.dispose();
//   }
// }