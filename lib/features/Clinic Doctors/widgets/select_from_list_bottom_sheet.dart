import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/common_app_bar_title.dart';
import 'package:shifa/core/widgtes/form_fields/custom_text_field.dart';

import '../../../core/assets/svg/svg_assets.dart';

void selectFromListBottomSheet({
  required BuildContext context,
  required List<String> list,
  required String title,
  required String hint,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // This makes the bottom sheet take full height
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
      ),
    ),
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            height: MediaQuery.of(context).size.height - 20,
            decoration: const BoxDecoration(
              color: AppTheme.whiteColor,
              // Change this to your desired background color
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
            child: Column(
              children: [
                CommonAppBarTitle(
                  title: title,
                  iconColor: AppTheme.primaryTextColor,
                  textColor: AppTheme.primaryTextColor,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextField(
                          hasName: false,
                          name: title,
                          hintText: "Search for $hint",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              SVGAssets.search,
                              width: 20.w,
                              height: 20.h,
                            ),
                          ),
                          labelText: "Search for $hint",
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pop(context, list[index]);
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      list[index],
                                      style: TextStyles.nexaRegular.copyWith(
                                        color: AppTheme.primaryTextColor,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    const Divider(
                                      color: AppTheme.greyColor,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
