import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/appbar_widget.dart';

class WaterMark extends StatelessWidget {
  final Color backGroundColor;

  final bool hasBorderRadius;
  final double height;
  final Widget contentChild;
  final Widget appBarChild;
  final Alignment alignment;

  const WaterMark({
    super.key,
    required this.backGroundColor,
    required this.hasBorderRadius,
    required this.contentChild,
    required this.appBarChild,
    required this.height,
    required this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SvgPicture.asset(
                themeProvider.currentTheme == ThemeEnum.shifa
                    ? SVGAssets.shifaLogoTransperant
                    : SVGAssets.leksellTransperant),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonAppBar(
                backGroundColor: backGroundColor,
                hasBorderRadius: hasBorderRadius,
                height: height,
                appBarChild: appBarChild,
                alignment: alignment,
              ),
              contentChild,
            ],
          ),
        ],
      ),
    );
  }
}
