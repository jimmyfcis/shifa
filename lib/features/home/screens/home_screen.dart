import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shifa/core/assets/svg/assets.dart';
import 'package:shifa/features/Profile/view/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  // List of pages for each tab
  final List<Widget> _pages = [
    Center(child: Text("Home Page")),
    Center(child: Text("Search Page")),
    Center(child: Text("Notifications Page")),
    Center(child: Text("Messages Page")),
    ProfileScreen(),
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
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            Brightness.dark, // This makes status bar icons dark
        statusBarBrightness: Brightness.dark, // This is for iOS
        systemNavigationBarColor: Colors.white, // Bottom navigation bar color
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
                selectedItemColor: HexColor("#4270B7"),
                type: BottomNavigationBarType.fixed,
                enableFeedback: false,
                elevation: 0, // Remove default shadow
                backgroundColor: Colors.white,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(SVGAssets.homeIcon),
                    activeIcon: SvgPicture.asset(
                      SVGAssets.homeSelectedIcon,
                      colorFilter: ColorFilter.mode(
                        HexColor("#4270B7"),
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
                        HexColor("#4270B7"),
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
                        HexColor("#4270B7"),
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
                        HexColor("#4270B7"),
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
                        HexColor("#4270B7"),
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
