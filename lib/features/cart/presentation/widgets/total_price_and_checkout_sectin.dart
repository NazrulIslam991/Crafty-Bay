import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/app/constants/constants.dart';
import 'package:crafty_bay/features/cart/presentation/controller/cart_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'package:get/get.dart';

class TotalPriceAndCheckoutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Price',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GetBuilder<CartListController>(
                builder: (controller) {
                  return Text(
                    "${takaSign}${controller.totalPrice}",
                    style: textTheme.titleMedium?.copyWith(
                      color: AppColors.themeColor,
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: GetBuilder<CartListController>(
              builder: (controller) {
                return FilledButton(
                  onPressed: () {
                    if (controller.totalPrice > 0) {
                      sslCommerez(controller.totalPrice.toDouble());
                    } else {
                      Get.snackbar('Error', 'Your cart is empty!');
                    }
                  },
                  child: const Text("Checkout"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> sslCommerez(double totalPrice) async {
  Sslcommerz sslcommerz = Sslcommerz(
    initializer: SSLCommerzInitialization(
      multi_card_name: "visa,master,bkash",
      currency: SSLCurrencyType.BDT,
      product_category: "Digital Product",
      sdkType: SSLCSdkType.TESTBOX,
      store_id: "bikre690364da94fdf",
      store_passwd: "bikre690364da94fdf@ssl",
      total_amount: totalPrice,
      tran_id: "TestTRX001",
    ),
  );

  final response = await sslcommerz.payNow();

  if (response.status == 'VALID') {
    print('Payment completed,');
    print(response.tranDate);
  }
  if (response.status == 'Closed') {
    print('Payment Closed');
  }
  if (response.status == 'FAILED') {
    print('Payment failed');
  }
}
