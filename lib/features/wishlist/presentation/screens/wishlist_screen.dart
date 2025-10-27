import 'package:crafty_bay/features/shared/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/presentation/controller/main_nav_controller.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        BackToCart();
      },
      child: Scaffold(
        appBar: AppBar(title: Text("WishList")),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 8,
            crossAxisCount: 3,
            childAspectRatio: 5 / 5,
            //crossAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            return FittedBox(child: ProductCard());
          },
          itemCount: 10,
        ),
      ),
    );
  }

  void BackToCart() {
    Get.find<MainNavController>().moveToCart();
  }
}
