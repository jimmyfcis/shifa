import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:shifa/core/localization/app_extensions.dart';

import '../../assets/svg/svg_assets.dart';
import '../../theme/styles.dart';
import '../../theme/theme.dart';
import '../../utils/validators.dart';

class ConfirmPasswordTextField extends StatefulWidget {
  final String? initialValue;
  final String name;
  final String labelText;
  final String? hintText;
  final bool isRequired;
  final TextEditingController passwordController;
  final List<String? Function(String?, String?)> validators;

  const ConfirmPasswordTextField({
    Key? key,
    this.initialValue,
    required this.name,
    required this.labelText,
    this.hintText,
    this.isRequired = false,
    required this.passwordController,
    this.validators = const [],
  }) : super(key: key);

  @override
  _ConfirmPasswordTextFieldState createState() => _ConfirmPasswordTextFieldState();
}

class _ConfirmPasswordTextFieldState extends State<ConfirmPasswordTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.isRequired ? "${widget.labelText}*" : widget.labelText,
          style: TextStyles.nexaRegular.copyWith(
            fontWeight: FontWeight.w400,
            color: AppTheme.primaryTextColor,
            fontSize: 14,
          ),
        ),
        SizedBox(height: 10.h),
        FormBuilderTextField(
            initialValue: widget.initialValue,
            name: widget.name,
          decoration: InputDecoration(
            fillColor: AppTheme.whiteColor,
            filled: true,
            errorStyle: TextStyles.nexaRegular.copyWith(
              fontWeight: FontWeight.w400,
              color: AppTheme.errorColor,
              fontSize: 13,
            ),
            errorBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide:  BorderSide(color: AppTheme.errorColor, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: AppTheme.greyColor, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: AppTheme.greyColor, width: 1),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: AppTheme.greyColor, width: 1),
            ),
            hintText: context.tr.translate('password_hint'),
            hintStyle: TextStyles.nexaRegular.copyWith(
              fontWeight: FontWeight.w400,
              color: AppTheme.hintColor,
              fontSize: 14,
            ),
            suffixIcon: obscureText?Image.asset(Assets.eyeClose):Image.asset(Assets.eyeOpen),
          ),
          cursorColor: AppTheme.blackColor,
            obscureText: obscureText,
            obscuringCharacter: "*",
            validator: FormBuilderValidators.compose(
              <String? Function(String?)>[
                if (widget.isRequired) (value) => Validators.isNotNullNorEmpty(value, widget.labelText),
                    (value) {
                  if (value != widget.passwordController.text) {
                    return "Passwords are not matching, please re-enter the password";
                  }
                  return null;
                },
              ],
            ),
        ),
      ],
    );
  }
}
