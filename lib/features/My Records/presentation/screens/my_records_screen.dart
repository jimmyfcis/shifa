import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/common_app_bar_title.dart';
import 'package:shifa/core/widgtes/watermark_widget.dart';
import 'package:shifa/features/My%20Records/data/models/visit_model.dart';
import 'package:shifa/features/My%20Records/widgets/my_records_body.dart';

class MyRecordsScreen extends StatelessWidget {
  final Visit visit;
  const MyRecordsScreen({super.key, required this.visit});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return WaterMark(
      appBarChild:  CommonAppBarTitle(title:context.tr.translate("my_records")),
      height: 105,
      alignment: Alignment.bottomCenter,
      backGroundColor: themeProvider.currentThemeData!.primaryColor,
      hasBorderRadius: false,
      contentChild:  MyRecordsBody(visit: visit),
    );
  }
}
