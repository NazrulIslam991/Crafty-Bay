import 'package:crafty_bay/features/cart/data/model/cart_item_model.dart';
import 'package:crafty_bay/features/cart/presentation/controller/cart_list_controller.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/center_circular_progress.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/incre_decre_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/app_color.dart';
import '../../../../app/constants/constants.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemModel});

  final CartItemModel cartItemModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 16),
      shadowColor: AppColors.themeColor.withOpacity(0.3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(4),
            decoration: BoxDecoration(),
            child: Image.network(
              cartItemModel.productModel.photos.isEmpty
                  ? ''
                  : cartItemModel.productModel.photos.first,
              height: 80,
              width: 80,
              errorBuilder: (_, __, ___) => Container(
                height: 80,
                width: 80,
                alignment: Alignment.center,
                child: Icon(Icons.error_outline),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartItemModel.productModel.title,
                              style: TextTheme.of(context).titleSmall,
                            ),
                            Text(
                              'Size: ${cartItemModel.size ?? 'Nil'}  Color: ${cartItemModel.color ?? 'Nil'}',
                              style: TextTheme.of(context).bodySmall,
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: cartItemModel.quantity > 0,
                        replacement: CenterCircularProgress(),
                        child: IconButton(
                          onPressed: () => _deleteCartItem(cartItemModel.id),
                          icon: Icon(
                            Icons.delete_forever_outlined,
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$takaSign${cartItemModel.productModel.currentPrice}',
                        style: TextTheme.of(
                          context,
                        ).titleSmall?.copyWith(color: AppColors.themeColor),
                      ),
                      IncreDecreButton(
                        onChange: (int value) {
                          Get.find<CartListController>().updateCart(
                            cartItemModel.id,
                            value,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _deleteCartItem(String cartItemId) async {
    await Get.find<CartListController>().deleteCartItem(cartItemId);
  }
}
