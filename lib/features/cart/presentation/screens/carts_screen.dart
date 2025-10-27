import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/app/assets_path.dart';
import 'package:crafty_bay/app/constants/constants.dart';
import 'package:crafty_bay/features/cart/presentation/widgets/total_price_and_checkout_sectin.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/incre_decre_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/presentation/controller/main_nav_controller.dart';

class CartsScreen extends StatefulWidget {
  const CartsScreen({super.key});

  @override
  State<CartsScreen> createState() => _CartsScreenState();
}

class _CartsScreenState extends State<CartsScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        BackToCategoty();
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Cart")),
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    elevation: 4,
                    shadowColor: AppColors.themeColor.withOpacity(0.3),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(4),
                          decoration: BoxDecoration(),
                          child: Image.asset(
                            AssetPaths.dummyShoe,
                            height: 80,
                            width: 80,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Nike shoe - 2025 Edition",
                                                style: TextTheme.of(
                                                  context,
                                                ).titleSmall,
                                              ),
                                              Text(
                                                "Size: XL Color: Red",
                                                style: TextTheme.of(
                                                  context,
                                                ).bodySmall,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.delete_forever_outlined),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${takaSign}100",
                                      style: TextTheme.of(context).titleSmall
                                          ?.copyWith(
                                            color: AppColors.themeColor,
                                          ),
                                    ),
                                    IncreDecreButton(onChange: (int value) {}),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 8);
                },
                itemCount: 5,
              ),
            ),
            TotalPriceAndCheckoutSection(),
          ],
        ),
      ),
    );
  }

  void BackToCategoty() {
    Get.find<MainNavController>().moveToCategory();
  }
}
