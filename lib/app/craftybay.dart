import 'package:crafty_bay/app/app_theme.dart';
import 'package:crafty_bay/app/controller/language_controller.dart';
import 'package:crafty_bay/features/auth/presentaion/screens/sign_in_screen.dart';
import 'package:crafty_bay/features/auth/presentaion/screens/sign_up_screen.dart';
import 'package:crafty_bay/features/auth/presentaion/screens/splash_screen.dart';
import 'package:crafty_bay/features/auth/presentaion/screens/verify_otp_screen.dart';
import 'package:crafty_bay/utils/languages.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Craftybay extends StatefulWidget {
  const Craftybay({super.key});

  static final LanguageController languageController = LanguageController();

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
          debugShowCheckedModeBanner: false,
          translations: Languages(),
          //locale: languageController.currentLocal,
          //locale: Locale('en', 'US'),
          locale: Locale('bn', 'BD'),
          fallbackLocale: Locale('en', 'US'),

          theme: AppTheme.lightThemeData,
          darkTheme: AppTheme.darkThemeData,
          themeMode: ThemeMode.light,

          home: SplashScreen(),

          initialRoute: SplashScreen.name,
          onGenerateRoute: (settings) {
            late Widget screen;

            if (settings.name == SplashScreen.name) {
              screen = SplashScreen();
            } else if (settings.name == SignInScreen.name) {
              screen = SignInScreen();
            } else if (settings.name == SignUpScreen.name) {
              screen = SignUpScreen();
            } else if (settings.name == VerifyOTPScreen.name) {
              screen = VerifyOTPScreen();
            }

            return MaterialPageRoute(builder: (ctx) => screen);
          },
        );
      },
    );
  }
}
