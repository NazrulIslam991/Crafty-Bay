import 'package:crafty_bay/app/app_theme.dart';
import 'package:crafty_bay/app/controller/language_controller.dart';
import 'package:crafty_bay/app/controller_binder.dart';
import 'package:crafty_bay/app/routes.dart';
import 'package:crafty_bay/features/auth/presentaion/screens/splash_screen.dart';
import 'package:crafty_bay/utils/languages.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Craftybay extends StatefulWidget {
  const Craftybay({super.key});

  static final LanguageController languageController = LanguageController();
  static final GlobalKey<NavigatorState> navigatorkey =
      GlobalKey<NavigatorState>();

  @override
  State<Craftybay> createState() => _CraftybayState();
}

class _CraftybayState extends State<Craftybay> {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(
    analytics: analytics,
  );

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Craftybay.languageController,
      builder: (languageController) {
        return GetMaterialApp(
          navigatorKey: Craftybay.navigatorkey,
          debugShowCheckedModeBanner: false,
          translations: Languages(),
          //locale: languageController.currentLocal,
          locale: Locale('en', 'US'),
          //locale: Locale('bn', 'BD'),
          fallbackLocale: Locale('en', 'US'),

          theme: AppTheme.lightThemeData,
          darkTheme: AppTheme.darkThemeData,
          themeMode: ThemeMode.light,

          home: SplashScreen(),

          initialRoute: SplashScreen.name, /////////////////////////////////
          onGenerateRoute: onGenerateRoute,
          initialBinding: ControllerBinding(),
        );
      },
    );
  }
}
