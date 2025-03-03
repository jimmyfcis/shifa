import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../assets/svg/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../theme/styles.dart';
import '../../theme/theme.dart';

class PhoneNumberField extends StatefulWidget {
  const PhoneNumberField({
    super.key,
    required this.controller,
    this.isRequired = true,
    this.labelText = "Phone Number",
    this.onInputChanged,  this.isValid=true,
  });

  final TextEditingController controller;
  final bool isRequired;
  final bool isValid;
  final void Function(String)? onInputChanged;
  final String labelText;

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  final FocusNode _focusNode = FocusNode();
  bool isValid = true;

  bool isValidEgyptianPhoneNumber(String input) {
    final RegExp egyptianPhoneRegex = RegExp(r'^\+20(1[0|1|2|5])\d{8}$|^\+200\d{8}$');
    return egyptianPhoneRegex.hasMatch(input);
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        setState(() {
          isValid = isValidEgyptianPhoneNumber(widget.controller.text);
        });
      }
    });
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
          style:  TextStyles.nexaRegular.copyWith(
            color: AppTheme.blackColor,
            fontSize: 14,
           // fontFamily: FontsAssets.Nexa,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: AppTheme.whiteColor,
            border: Border.all(
              color: !isValid && widget.controller.text.isNotEmpty
                  ? Colors.red
                  : AppTheme.greyColor,
              width: 2,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          ),
          child: TextField(
            focusNode: _focusNode,
            controller: widget.controller,
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly, // Allow only numbers
            ],
            onChanged: (value) {
              if (widget.onInputChanged != null) {
                widget.onInputChanged!(value);
              }
              setState(() {
                isValid = isValidEgyptianPhoneNumber(value);
              });
            },
            onSubmitted: (value) {
              setState(() {
                isValid = isValidEgyptianPhoneNumber(value);
              });
            },
            decoration: InputDecoration(
              hintText: "Phone number",
              hintStyle:  TextStyles.nexaRegular.copyWith(
                fontWeight: FontWeight.w400,
                color: AppTheme.hintColor,
                fontSize: 14,
              ),
              fillColor: AppTheme.whiteColor,
              filled: true,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SvgPicture.asset(SVGAssets.line),
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorText: !isValid && widget.controller.text.isNotEmpty
                  ? "Invalid phone number"
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
