import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/features/Booking/screens/booking_screen.dart';
import 'package:shifa/features/Clinics/screens/clinics_screen.dart';
import 'package:shifa/features/My%20Care/screens/my_care_screen.dart';
import '../../../core/firebase/firebase_messaging.dart';
import '../../Home/presentation/screens/home_screen.dart';
import '../../Profile/screens/profile_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class BottomBarScreen extends StatefulWidget {
  final int? index;

  const BottomBarScreen({super.key, this.index});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int pageIndex = 0;

  @override
  void initState() {
    // Add FCM listeners
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Received a foreground message: \\${message.notification?.title}');
      FirebaseNotification().showNotification(message); // <-- Add this line
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('User tapped a notification: \\${message.data}');
      // Navigate or handle as needed
    });
    if (widget.index != null) {
      pageIndex = widget.index!;
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: widget.index ?? 0);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: controller,
        onPageChanged: (index) => setState(() {
          pageIndex = index;
          controller.jumpToPage(index);
        }),
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
                label: context.tr.translate("home"),
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
                label: context.tr.translate("bookings"),
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
                label: context.tr.translate("clinics"),
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
                label: context.tr.translate("my_care"),
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
                label: context.tr.translate("profile"),
              ),
            ],
            currentIndex: pageIndex,
            // Use state.selectedIndex
            onTap: (index) => setState(() {
              pageIndex = index;
              controller.jumpToPage(index);
            }),
          ),
        ),
      ),
    );
  }
}
