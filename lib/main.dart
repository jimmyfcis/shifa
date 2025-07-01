import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/localization/app_localizations.dart';
import 'package:shifa/core/localization/locale_provider.dart';
import 'core/network/injection_container.dart';
import 'core/routes/app_router.dart';
import 'core/routes/app_routes.dart';
import 'core/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
