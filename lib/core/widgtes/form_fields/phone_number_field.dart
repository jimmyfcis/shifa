import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../assets/svg/svg_assets.dart';
import '../../theme/styles.dart';
import '../../theme/theme.dart';
import 'package:flutter_svg/svg.dart';

class PhoneNumberField extends StatefulWidget {
  const PhoneNumberField({
    super.key,
    required this.controller,
    this.isRequired = true,
    this.labelText = "Phone Number",
    this.onInputChanged, this.isValid = true,
  });

  final TextEditingController controller;
  final bool isRequired;
  final bool isValid;
  final void Function(PhoneNumber)? onInputChanged;
  final String labelText;

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  String initialCountry = 'EG';
  PhoneNumber number = PhoneNumber(isoCode: 'EG');
  final FocusNode _focusNode = FocusNode();

  bool isValidEgyptianPhoneNumber(String input) {
    final RegExp egyptianPhoneRegex = RegExp(
      r'^(\+20(1[0125]\d{8})|\+200\d{8})$',
    );
    return egyptianPhoneRegex.hasMatch(input);
  }

  @override
  void initState() {
    super.initState();
    // _focusNode.addListener(() {
    //   if (!_focusNode.hasFocus) {
    //     setState(() {
    //       isValid = isValidEgyptianPhoneNumber(widget.controller.text);
    //     });
    //   }
    // });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.isRequired ? "${widget.labelText}*" : widget.labelText,
          style: TextStyles.nexaRegular.copyWith(
            color: AppTheme.blackColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: AppTheme.whiteColor,
            border: Border.all(
              color:  !widget.isValid ? AppTheme.errorColor : AppTheme.greyColor,
              width: 2,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          ),
          child: InternationalPhoneNumberInput(
            focusNode: _focusNode,
            autoFocusSearch: true,
            spaceBetweenSelectorAndTextField: 0,
            onInputChanged: widget.onInputChanged,
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.DIALOG,
            ),
            ignoreBlank: true,
            autoValidateMode: AutovalidateMode.disabled,
            selectorTextStyle: TextStyles.nexaRegular.copyWith(color: Colors.black),
            initialValue: number,
            textFieldController: widget.controller,
            formatInput: true,
            searchBoxDecoration: InputDecoration(
              fillColor: AppTheme.whiteColor,
              filled: true,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  SVGAssets.search,
                  width: 24,
                  height: 24,
                ),
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              hintText: "Search for country",
              hintStyle: TextStyles.nexaRegular.copyWith(
                fontWeight: FontWeight.w400,
                color: AppTheme.hintColor,
                fontSize: 14,
              ),
            ),
            inputDecoration: InputDecoration(
              fillColor: AppTheme.whiteColor,
              filled: true,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SvgPicture.asset(SVGAssets.line),
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              hintText: "Phone number",
              hintStyle: TextStyles.nexaRegular.copyWith(
                fontWeight: FontWeight.w400,
                color: AppTheme.hintColor,
                fontSize: 14,
              ),
            ),
            inputBorder: InputBorder.none,
            cursorColor: AppTheme.blackColor,
            keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
          ),
        ),
        if (!widget.isValid)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Invalid phone number",
              style: TextStyles.nexaBold.copyWith(
                color: Colors.red,
                fontSize: 14,
              ),
            ),
          ),
      ],
    );
  }
}
