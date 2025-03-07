import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/styles.dart';
import '../theme/theme.dart';

class CustomWhiteButton extends StatefulWidget {
  final String? title;
  final void Function()? onPressed;

  const CustomWhiteButton({super.key, this.title, this.onPressed});

  @override
  State<CustomWhiteButton> createState() => _CustomWhiteButtonState();
}

class _CustomWhiteButtonState extends State<CustomWhiteButton> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(0),
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.transparent),
            shadowColor: MaterialStateProperty.all<Color>(AppTheme.green4Color),
            overlayColor:
                MaterialStateProperty.all<Color>(AppTheme.green4Color),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(
                    color: themeProvider.currentThemeData!.primaryColor),
              ),
            ),
          ),
          onPressed: widget.onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              widget.title ?? "Next",
              style: TextStyles.nexaRegular.copyWith(
                color: themeProvider.currentThemeData!.primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          )),
    );
  }
}
