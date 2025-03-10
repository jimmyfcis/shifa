import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/models/radiolog_model.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/utils/enums.dart';
import 'package:shifa/core/widgtes/common_app_bar_title.dart';
import 'package:shifa/core/widgtes/watermark_widget.dart';
import 'package:shifa/features/Records%20Detail/widgets/records_detail_body.dart';

class RecordsDetailsScreen extends StatelessWidget {
  final String title;
  final RecordsModel radiologyReport;
  final RecordType recordType;

  const RecordsDetailsScreen(
      {super.key,
      required this.radiologyReport,
      required this.title,
      required this.recordType});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return WaterMark(
      backGroundColor: themeProvider.currentThemeData!.primaryColor,
      appBarChild: CommonAppBarTitle(title: title),
      height: 105,
      alignment: Alignment.bottomCenter,
      hasBorderRadius: false,
      contentChild: RecordsDetailBody(
        recordType: recordType,
        radiologyReport: radiologyReport,
      ),
    );
  }
}
