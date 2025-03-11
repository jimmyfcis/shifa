import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../assets/svg/svg_assets.dart';
import '../../theme/styles.dart';
import '../../theme/theme.dart';
import '../../utils/validators.dart';

class PasswordTextField extends StatefulWidget {
  final String? initialValue;
  final String name;
  final String labelText;
  final String? hintText;
  final bool isRequired;
  final TextEditingController? controller;
  final List<String? Function(String?, String?)> validators;

  const PasswordTextField({
    Key? key,
    this.initialValue,
    required this.name,
    required this.labelText,
    this.hintText,
    this.isRequired = false,
    this.controller,
    this.validators = const [],
  }) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
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

          controller: widget.controller,
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
            hintText: "Enter your password",
            hintStyle: TextStyles.nexaRegular.copyWith(
              fontWeight: FontWeight.w400,
              color: AppTheme.hintColor,
              fontSize: 14,
            ),
            suffixIcon: InkWell(
                onTap: (){
                  setState(() {
                    obscureText= !obscureText;
                  });
                },
                child: obscureText?Image.asset(Assets.eyeClose):Image.asset(Assets.eyeOpen)),
          ),
          cursorColor: AppTheme.blackColor,
          obscureText: obscureText,
          obscuringCharacter: "*",
          validator: FormBuilderValidators.compose(
            <String? Function(String?)>[
              if (widget.isRequired) (value) => Validators.isNotNullNorEmpty(value, widget.labelText),
              for (final validator in widget.validators) (value) => validator(value, widget.labelText),
            ],
          ),
        ),
      ],
    );
  }
}
