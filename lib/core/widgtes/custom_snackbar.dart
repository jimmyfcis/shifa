import 'package:flutter/material.dart';

import '../routes/app_routes.dart';

void showCustomSnackBar(BuildContext context, String message, {bool isError = false,int statusCode=0}) {
  if(statusCode==401)
    {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Session Expired"),
              content: Text("Your session expired. Please login to continue."),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, AppRoutes.login, (route) => false);
                  },
                  child: Text("Login"),
                ),
              ],
            );
          },
        );
    }
  else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
      ),
    );
  }
}
