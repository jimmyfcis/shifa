import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/features/Booking/screens/booking_screen.dart';
import 'package:shifa/features/Clinics/screens/clinics_screen.dart';
import 'package:shifa/features/My%20Care/screens/my_care_screen.dart';

import '../../Profile/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  // List of pages for each tab
  final List<Widget> _pages = [
    const Center(child: Text("Home Page")),
    const BookingScreen(),
    const ClinicsScreen(),
    const MyCareScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index); // Navigate to the selected page
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        // This makes status bar icons dark
        statusBarBrightness: Brightness.light,
        // This is for iOS
        systemNavigationBarColor: Colors.white,
        // Bottom navigation bar color
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
          backgroundColor: Colors.white, // Add this to ensure white background
          body: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            children: _pages,
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
                // Remove default shadow
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
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
              ),
            ),
          )),
    );
  }
}
