import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/features/Booking/screens/booking_screen.dart';
import 'package:shifa/features/Clinics/screens/clinics_screen.dart';
import 'package:shifa/features/My%20Care/screens/my_care_screen.dart';
import '../../Home/presentation/screens/home_screen.dart';
import '../../Profile/screens/profile_screen.dart';
import '../cubit/bottom_bar_cubit.dart';
import '../cubit/bottom_bar_state.dart';

class BottomBarScreen extends StatefulWidget {
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    // Listen for state changes and update the PageController
    _pageController.addListener(_onPageChanged);
  }

  @override
  void dispose() {
    _pageController.removeListener(_onPageChanged);
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged() {
    // Update the Cubit state when the page changes
    final currentPage = _pageController.page?.round() ?? 0;
    context.read<BottomBarCubit>().updateIndex(currentPage);
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return BlocBuilder<BottomBarCubit, BottomBarState>(
      builder: (context, state) {
        // Sync the PageController with the Cubit state
        if (_pageController.hasClients &&
            state.selectedIndex != _pageController.page?.round()) {
          _pageController.jumpToPage(state.selectedIndex);
        }

        return Scaffold(
          backgroundColor: Colors.white,
          body: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              // This is handled by the listener
            },
            children: const [
              HomeScreen(),
              BookingScreen(),
              ClinicsScreen(),
              MyCareScreen(),
              ProfileScreen(),
            ],
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.only(top: 8.h),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            child: Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: BottomNavigationBar(
                selectedItemColor: themeProvider.currentThemeData!.primaryColor,
                type: BottomNavigationBarType.fixed,
                enableFeedback: false,
                elevation: 0,
                backgroundColor: Colors.white,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(SVGAssets.homeIcon),
                    activeIcon: SvgPicture.asset(
                      SVGAssets.homeSelectedIcon,
                      colorFilter: ColorFilter.mode(
                        themeProvider.currentThemeData!.primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(SVGAssets.bookingIcon),
                    activeIcon: SvgPicture.asset(
                      SVGAssets.bookingSelectedIcon,
                      colorFilter: ColorFilter.mode(
                        themeProvider.currentThemeData!.primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'Bookings',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(SVGAssets.clinicsIcon),
                    activeIcon: SvgPicture.asset(
                      SVGAssets.clincssSelectedIcon,
                      colorFilter: ColorFilter.mode(
                        themeProvider.currentThemeData!.primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'Clinics',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(SVGAssets.myCareIcon),
                    activeIcon: SvgPicture.asset(
                      SVGAssets.myCareSelectedIcon,
                      colorFilter: ColorFilter.mode(
                        themeProvider.currentThemeData!.primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'My Care',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(SVGAssets.profileIcon),
                    activeIcon: SvgPicture.asset(
                      SVGAssets.profileSelectedIcon,
                      colorFilter: ColorFilter.mode(
                        themeProvider.currentThemeData!.primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'Profile',
                  ),
                ],
                currentIndex: state.selectedIndex,
                // Use state.selectedIndex
                onTap: (index) {
                  context.read<BottomBarCubit>().updateIndex(index);
                  _pageController.jumpToPage(index);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
