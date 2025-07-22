import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/firebase/firebase_messaging.dart';
import 'package:shifa/core/localization/app_localizations.dart';
import 'package:shifa/core/localization/locale_provider.dart';
import 'package:shifa/core/utils/utils.dart';
import 'package:shifa/firebase_options.dart';
import 'core/network/injection_container.dart';
import 'core/routes/app_router.dart';
import 'core/routes/app_routes.dart';
import 'core/theme/theme.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Register background handler
  FirebaseMessaging.onBackgroundMessage(FirebaseNotification().firebaseMessagingBackgroundHandler);

  await FirebaseNotification().setupFlutterNotifications();
  await FirebaseNotification().requestNotificationPermission();
  Utils.getFcmToken();
  await init(); // initialize dependency injection
  await ThemeProvider.instance.initiateTheme();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider.instance),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        theme: Provider.of<ThemeProvider>(context).currentThemeData,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.firstSplash,
        onGenerateRoute: AppRouter.generateRoute,
        
        // Add localization support
        locale: localeProvider.locale,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        // Use RTL for Arabic, LTR for others
        builder: (context, child) {
          return Directionality(
            textDirection: localeProvider.isRtl ? TextDirection.rtl : TextDirection.ltr,
            child: child!,
          );
        },
      ),
    );
  }
}

// NOTE: To handle foreground and opened notifications, add the following in your first screen or a global StatefulWidget:
//
// @override
// void initState() {
//   super.initState();
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     print('Received a foreground message: \\${message.notification?.title}');
//     // Optionally show a custom notification using flutter_local_notifications
//   });
//   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//     print('User tapped a notification: \\${message.data}');
//     // Navigate or handle as needed
//   });
// }
