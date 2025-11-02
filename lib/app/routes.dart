import 'package:crafty_bay/features/auth/presentaion/screens/sign_in_screen.dart';
import 'package:crafty_bay/features/auth/presentaion/screens/sign_up_screen.dart';
import 'package:crafty_bay/features/auth/presentaion/screens/splash_screen.dart';
import 'package:crafty_bay/features/auth/presentaion/screens/verify_otp_screen.dart';
import 'package:crafty_bay/features/home/presentation/screens/home.dart';
import 'package:crafty_bay/features/products/presentation/screens/product_details_screen.dart';
import 'package:crafty_bay/features/products/presentation/screens/product_list_screen.dart';
import 'package:crafty_bay/features/products/presentation/screens/product_types_list_screen.dart';
import 'package:crafty_bay/features/shared/data/category_model.dart';
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
  } else if (settings.name == VerifyOtpScreen.name) {
    final String email = settings.arguments as String;
    screen = VerifyOtpScreen(email: email);
  } else if (settings.name == HomeScreen.name) {
    screen = HomeScreen();
  } else if (settings.name == BottomNavBarScreen.name) {
    screen = BottomNavBarScreen();
  } else if (settings.name == ProductListScreen.name) {
    final CategoryModel category = settings.arguments as CategoryModel;
    screen = ProductListScreen(category: category);
  } else if (settings.name == ProductDetailsScreen.name) {
    final String productId = settings.arguments as String;
    screen = ProductDetailsScreen(productId: productId);
  } else if (settings.name == ProductTypeListScreen.name) {
    final String ProductType = settings.arguments as String;
    screen = ProductTypeListScreen(productType: ProductType);
  }

  return MaterialPageRoute(builder: (ctx) => screen);
}
