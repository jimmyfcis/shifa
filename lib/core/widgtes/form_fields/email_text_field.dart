import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../theme/styles.dart';
import '../../theme/theme.dart';
import '../../utils/validators.dart';

class EmailTextField extends StatelessWidget {
  final String? initialValue;
  final bool enabled;
  final String name;
  final String labelText;
  final String? hintText;
  final bool isRequired;
  final TextEditingController? controller;

  final ValueChanged<String?>? onChanged;
  final int maxLines;

  const EmailTextField({
    Key? key,
    this.initialValue,
    this.enabled = true,
    required this.name,
    required this.labelText,
    this.hintText,
    this.isRequired = false,
    this.onChanged,
    this.maxLines = 1, this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isRequired ? "$labelText*" : labelText,
          style: TextStyles.nexaRegular.copyWith(
            fontWeight: FontWeight.w400,
            color: AppTheme.primaryTextColor,
            fontSize: 14,
          ),
        ),
        SizedBox(height: 10.h),
        FormBuilderTextField(
            initialValue: initialValue,
            enabled: enabled,
            name: name,
            controller: controller,
            maxLines: maxLines,
            style: TextStyle(
              color: enabled ? Colors.black : Colors.grey,
            ),
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
            hintText: hintText,
            hintStyle: TextStyles.nexaRegular.copyWith(
              fontWeight: FontWeight.w400,
              color: AppTheme.hintColor,
              fontSize: 14,
            ),
          ),
          cursorColor: AppTheme.blackColor,
            validator: FormBuilderValidators.compose(
              <String? Function(String?)>[
                if (isRequired) (value) => Validators.isNotNullNorEmpty(value, labelText,context),
                    (value) => Validators.email(value, labelText,context),
              ],
            ),
            onChanged: onChanged,
        ),
      ],
    );
  }
}