import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/styles.dart';
import '../theme/theme.dart';

class CustomGreenButton extends StatefulWidget {
  final String? title;
  final double? fontSize;
  final double? width;
  final double? height;
  final double? borderRadius;
  final EdgeInsets? padding;
  final void Function()? onPressed;

  const CustomGreenButton(
      {super.key,
      this.title,
      this.onPressed,
      this.fontSize,
      this.borderRadius,
      this.padding,
      this.width,
      this.height});

  @override
  State<CustomGreenButton> createState() => _CustomGreenButtonState();
}

class _CustomGreenButtonState extends State<CustomGreenButton> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height,
      child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(0),
            padding:
                MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
            backgroundColor: MaterialStateProperty.all<Color>(
                themeProvider.currentThemeData!.primaryColor),
            shadowColor: MaterialStateProperty.all<Color>(AppTheme.green4Color),
            overlayColor:
                MaterialStateProperty.all<Color>(AppTheme.green4Color),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0),
                side: BorderSide(
                    color: themeProvider.currentThemeData!.primaryColor),
              ),
            ),
          ),
          onPressed: widget.onPressed,
          child: Padding(
            padding:
                widget.padding ?? const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              widget.title ?? "Next",
              style: TextStyles.nexaRegular.copyWith(
                color: AppTheme.whiteColor,
                fontSize: widget.fontSize ?? 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          )),
    );
  }
}
