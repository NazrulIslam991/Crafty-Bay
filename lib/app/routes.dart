import 'package:crafty_bay/features/auth/presentaion/screens/sign_in_screen.dart';
import 'package:crafty_bay/features/auth/presentaion/screens/sign_up_screen.dart';
import 'package:crafty_bay/features/auth/presentaion/screens/splash_screen.dart';
import 'package:crafty_bay/features/auth/presentaion/screens/verify_otp_screen.dart';
import 'package:crafty_bay/features/home/presentation/screens/home.dart';
import 'package:crafty_bay/features/products/presentation/screens/product_details_screen.dart';
import 'package:crafty_bay/features/products/presentation/screens/product_list_screen.dart';
import 'package:crafty_bay/features/shared/presentation/screen/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

MaterialPageRoute onGenerateRoute(RouteSettings settings) {
  late Widget screen;

  if (settings.name == SplashScreen.name) {
    screen = SplashScreen();
  } else if (settings.name == SignInScreen.name) {
    screen = SignInScreen();
  } else if (settings.name == SignUpScreen.name) {
    screen = SignUpScreen();
  } else if (settings.name == VerifyOTPScreen.name) {
    screen = VerifyOTPScreen();
  } else if (settings.name == HomeScreen.name) {
    screen = HomeScreen();
  } else if (settings.name == BottomNavBarScreen.name) {
    screen = BottomNavBarScreen();
  } else if (settings.name == ProductListScreen.name) {
    final String category = settings.arguments as String;
    screen = ProductListScreen(categoryName: category);
  } else if (settings.name == ProductDetailsScreen.name) {
    //final String category = settings.arguments as String;
    screen = ProductDetailsScreen();
  }

  return MaterialPageRoute(builder: (ctx) => screen);
}
