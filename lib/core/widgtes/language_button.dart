import 'package:flutter/material.dart';
import 'package:shifa/core/theme/theme.dart';
import '../theme/styles.dart';

class LanguageButton extends StatelessWidget {
  final String language;
  final void Function()? onTap;
  final bool isSelected;

  const LanguageButton({
    super.key,
    required this.language,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all<double>(0),
              backgroundColor: MaterialStateProperty.all<Color>(
                isSelected ? AppTheme.shifaPrimaryColor.withOpacity(0.1) : AppTheme.whiteColor
              ),
              shadowColor:
                  MaterialStateProperty.all<Color>(AppTheme.green4Color),
              overlayColor:
                  MaterialStateProperty.all<Color>(AppTheme.green4Color),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(
                        color: isSelected ? AppTheme.shifaPrimaryColor : AppTheme.greyColor,
                        width: isSelected ? 1.5 : 1.0,
                      )
                  )
              )
          ),
          onPressed: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              language,
              style: TextStyles.nexaRegular.copyWith(
                color: isSelected ? AppTheme.shifaPrimaryColor : AppTheme.blackColor,
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w300,
              ),
            ),
          )),
    );
  }
}
