import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/features/Booking/widgets/appointment_list_view.dart';

class AppointmentBody extends StatefulWidget {
  const AppointmentBody({super.key});

  @override
  State<AppointmentBody> createState() => _AppointmentBodyState();
}

class _AppointmentBodyState extends State<AppointmentBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        Container(
          height: 50.h,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: themeProvider.currentTheme == ThemeEnum.shifa
                ? AppTheme.billColor
                : AppTheme.secondaryColorLeksell,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TabBar(
            controller: _tabController,
            dividerColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(8), // Creates rounded corners
              color: themeProvider
                  .currentThemeData!.primaryColor, // Color for the selected tab
            ),
            unselectedLabelColor: AppTheme.textBlackColor,

            // Color for the unselected tabs
            tabs: [
              Tab(
                child: Text(
                  "Upcoming",
                  style: TextStyles.nexaRegular.copyWith(
                    fontSize: 14.sp,
                    color: _selectedIndex == 0
                        ? Colors.white
                        : AppTheme.textBlackColor,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "Past",
                  style: TextStyles.nexaRegular.copyWith(
                    fontSize: 14.sp,
                    color: _selectedIndex == 1
                        ? Colors.white
                        : AppTheme.textBlackColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              AppointmentListView(
                tabSelectedIndex: _selectedIndex,
              ),
              AppointmentListView(
                tabSelectedIndex: _selectedIndex,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
