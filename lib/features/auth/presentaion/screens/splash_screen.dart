import 'package:crafty_bay/features/auth/presentaion/screens/sign_in_screen.dart';
import 'package:crafty_bay/features/shared/presentation/screen/bottom_nav_bar.dart';
import 'package:crafty_bay/utils/app_version_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/controller/auth_controller.dart';
import '../widget/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name = '/'; /////////////////////////////////////////

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(Duration(seconds: 3));
    bool isUserLoggedIn = await Get.find<AuthController>()
        .isUserAlreadyLoggedIn();
    if (isUserLoggedIn) {
      await Get.find<AuthController>().loadUserData();
      Navigator.pushReplacementNamed(context, BottomNavBarScreen.name);
    } else {
      Navigator.pushReplacementNamed(context, SignInScreen.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Spacer(),
              AppLogo(),
              Spacer(),
              CircularProgressIndicator(),
              const SizedBox(height: 12),
              Text("${'Version'.tr} ${AppVersionServces.currentAppVersion}"),
            ],
          ),
        ),
      ),
    );
  }
}
