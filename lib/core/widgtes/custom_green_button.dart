import 'package:flutter/material.dart';
import '../theme/theme.dart';
class CustomGreenButton extends StatefulWidget {
  final String? title;
  final void Function()? onPressed;
  const CustomGreenButton({super.key, this.title, this.onPressed});

  @override
  State<CustomGreenButton> createState() => _CustomGreenButtonState();
}

class _CustomGreenButtonState extends State<CustomGreenButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all<double>(0),
              backgroundColor: MaterialStateProperty.all<Color>(AppTheme.primaryColor),
              shadowColor: MaterialStateProperty.all<Color>(AppTheme.green4Color),
              overlayColor: MaterialStateProperty.all<Color>(AppTheme.green4Color),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), side: const BorderSide(color: AppTheme.primaryColor)))),
          onPressed: widget.onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              widget.title??"Next",
              style: TextStyle(
                color: AppTheme.whiteColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          )),
    );
  }
}
