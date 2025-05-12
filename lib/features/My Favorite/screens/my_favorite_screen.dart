import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/common_app_bar_title.dart';
import 'package:shifa/core/widgtes/watermark_widget.dart';
import 'package:shifa/features/My%20Favorite/widgets/my_favorite_body.dart';

import '../../../core/models/clinic_model.dart';
import '../../../core/models/doctor_model.dart';

class MyFavoriteScreen extends StatelessWidget {
  final Doctor? doctor;
  final Clinic clinic;
  const MyFavoriteScreen({super.key, this.doctor, required this.clinic});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return WaterMark(
      appBarChild: const CommonAppBarTitle(title: "My Favorite"),
      height: 105,
      alignment: Alignment.bottomCenter,
      backGroundColor: themeProvider.currentThemeData!.primaryColor,
      hasBorderRadius: false,
      contentChild:  Expanded(child: MyFavoriteBody(clinic: clinic,doctor: doctor,)),
    );
  }
}
