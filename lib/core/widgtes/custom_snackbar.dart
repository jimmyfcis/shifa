import 'package:flutter/material.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/theme/theme.dart';

import '../routes/app_routes.dart';

void showCustomSnackBar(BuildContext context, String message, {bool isError = false, int statusCode = 0}) {
  if (statusCode == 401) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppTheme.whiteColor,
          title: Text(context.tr.translate("session_expired")),
          content: Text(context.tr.translate("session_expired_desc")),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, AppRoutes.login, (route) => false);
              },
              child: Text(context.tr.translate("login")),
            ),
          ],
        );
      },
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message == "Something went wrong. Please try again." ? context.tr.translate("error") : message),
        backgroundColor: isError ? Colors.red : Colors.green,
      ),
    );
  }
}
