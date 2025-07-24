import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/common_app_bar_title.dart';
import 'package:shifa/core/widgtes/watermark_widget.dart';
import 'package:shifa/features/Records%20Detail/presntation/widgets/records_detail_body.dart';

class RecordsDetailsScreen extends StatelessWidget {
  final String? file;
  final bool isLab;

  const RecordsDetailsScreen(
      {super.key,
       this.file,required this.isLab,});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return WaterMark(
      backGroundColor: themeProvider.currentThemeData!.primaryColor,
      appBarChild: CommonAppBarTitle(title: ""),
      height: 105,
      alignment: Alignment.bottomCenter,
      hasBorderRadius: false,
      contentChild: RecordsDetailBody(
        file: file,
        isLab: isLab,
      ),
    );
  }
}
