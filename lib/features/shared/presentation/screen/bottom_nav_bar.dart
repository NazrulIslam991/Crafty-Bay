import 'package:crafty_bay/features/cart/presentation/screens/carts_screen.dart';
import 'package:crafty_bay/features/category/presentation/screens/category_list_screen.dart';
import 'package:crafty_bay/features/home/presentation/screens/home.dart';
import 'package:crafty_bay/features/shared/presentation/controller/main_nav_controller.dart';
import 'package:crafty_bay/features/wishlist/presentation/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  static const String name = '/bottom_nav_bar';

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    CategoryListScreen(),
    CartsScreen(),
    WishListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainNavController>(
      builder: (mainNavController) {
        return Scaffold(
          body: _screens[mainNavController.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.lightBlue[100],
            currentIndex: mainNavController.currentIndex,
            onTap: mainNavController.changeIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard_customize_outlined),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_checkout),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline),
                label: 'Wishlist',
              ),
            ],
          ),
        );
      },
    );
  }
}
