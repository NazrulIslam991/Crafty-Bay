import 'package:crafty_bay/features/cart/presentation/controller/cart_list_controller.dart';
import 'package:crafty_bay/features/cart/presentation/widgets/total_price_and_checkout_sectin.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/center_circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/presentation/controller/main_nav_controller.dart';
import '../widgets/cart_item.dart';

class CartsScreen extends StatefulWidget {
  const CartsScreen({super.key});

  @override
  State<CartsScreen> createState() => _CartsScreenState();
}

class _CartsScreenState extends State<CartsScreen> {
  final CartListController _cartListController = Get.find<CartListController>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cartListController.getCartList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        BackToCategoty();
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Cart")),
        body: GetBuilder(
          init: _cartListController,
          builder: (controller) {
            if (controller.inProgress) {
              return CenterCircularProgress();
            } else if (controller.errorMessege != null) {
              return Center(child: Text(controller.errorMessege!));
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return CartItem(
                        cartItemModel: controller.cartItemList[index],
                      );
                    },
                    itemCount: controller.cartItemList.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 8);
                    },
                  ),
                ),
                TotalPriceAndCheckoutSection(),
              ],
            );
          },
        ),
      ),
    );
  }

  void BackToCategoty() {
    Get.find<MainNavController>().moveToCategory();
  }
}
