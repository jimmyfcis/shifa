import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import '../../assets/svg/svg_assets.dart';
import '../../theme/styles.dart';
import '../../theme/theme.dart';
import '../../utils/validators.dart';

class CustomDateField extends StatelessWidget {
  final bool enabled;
  final String name;
  final String labelText;
  final String? hintText;
  final bool isRequired;
  final InputType inputType;

  final DateTime? firstDate, lastDate;
  final bool Function(DateTime)? selectableDayPredicate;
  final DateTime? initialValue;
  final List<String? Function(DateTime?, String?)> validators;
  final ValueChanged<DateTime?>? onChanged;

  const CustomDateField({
    super.key,
    this.enabled = true,
    required this.name,
    required this.labelText,
    this.hintText,
    this.firstDate,
    this.lastDate,
    this.selectableDayPredicate,
    this.initialValue,
    this.validators = const [],
    this.isRequired = false,
    this.onChanged, this.inputType=InputType.date,
  });

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
        FormBuilderDateTimePicker(
            enabled: enabled,
            name: name,
            decoration: InputDecoration(
              errorMaxLines: 10,
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
              hintStyle: TextStyles.nexaRegular.copyWith(
                fontWeight: FontWeight.w400,
                color: AppTheme.hintColor,
                fontSize: 14,
              ),
              hintText: hintText??"dd/mm/yyyy",
              suffixIcon: inputType==InputType.date?Image.asset(Assets.calendarForm):Image.asset(Assets.clockForm),
            ),
            format: DateFormat("${DateFormat.WEEKDAY} ${DateFormat.DAY} ${DateFormat.ABBR_MONTH}"),
            inputType: inputType,
            firstDate: firstDate,
            lastDate: lastDate,
            selectableDayPredicate: selectableDayPredicate,
            initialValue: initialValue,
            validator: FormBuilderValidators.compose(
              <String? Function(DateTime?)>[
                if (isRequired) (value) => Validators.required(value, labelText,context),
                for (final validator in validators) (value) => validator(value, labelText),
              ],
            ),
            onChanged: onChanged,
        ),
      ],
    );
  }
}