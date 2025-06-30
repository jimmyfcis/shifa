import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/common_app_bar_title.dart';
import 'package:shifa/core/widgtes/watermark_widget.dart';
import 'package:shifa/features/news/widgets/news_list_view.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return WaterMark(
      alignment: Alignment.bottomCenter,
      height: 105,
      hasBorderRadius: false,
      backGroundColor: themeProvider.currentThemeData!.primaryColor,
      appBarChild:  CommonAppBarTitle(
        title: context.tr.translate('news'),
      ),
      contentChild: const Expanded(child: NewsList()),
    );
  }
}
