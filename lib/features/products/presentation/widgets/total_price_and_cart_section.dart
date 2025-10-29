import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/app/constants/constants.dart';
import 'package:crafty_bay/app/controller/auth_controller.dart';
import 'package:crafty_bay/features/auth/presentaion/screens/sign_in_screen.dart';
import 'package:crafty_bay/features/products/presentation/controllers/add_to_cart_controller.dart';
import 'package:crafty_bay/features/shared/data/product_details_model.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/center_circular_progress.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/snackbar_messege.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TotalPriceAndCartAction extends StatefulWidget {
  const TotalPriceAndCartAction({super.key, required this.productModel});

  final ProductDetailsModel productModel;
  @override
  State<TotalPriceAndCartAction> createState() =>
      _TotalPriceAndCartActionState();
}

class _TotalPriceAndCartActionState extends State<TotalPriceAndCartAction> {
  final AddToCartController _cartController = AddToCartController();
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
                'Price',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "${takaSign}${widget.productModel.currentPrice}",
                style: textTheme.titleMedium?.copyWith(
                  color: AppColors.themeColor,
                ),
              ),
            ],
          ),
          GetBuilder(
            init: _cartController,
            builder: (controller) {
              return SizedBox(
                width: 120,
                child: Visibility(
                  visible: controller.addToCartInProgress == false,
                  replacement: CenterCircularProgress(),
                  child: FilledButton(
                    onPressed: () => _onTapAddToCardButton(),
                    child: Text('Add to Cart'),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> _onTapAddToCardButton() async {
    if (await Get.find<AuthController>().isUserAlreadyLoggedIn()) {
      final bool isSuccess = await _cartController.addToCart(
        widget.productModel.Id,
      );
      if (isSuccess) {
        showSnackBarMessege(context, 'Added to cart');
      } else {
        showSnackBarMessege(context, _cartController.errorMessage!);
      }
    } else {
      Navigator.pushNamed(context, SignInScreen.name);
    }
  }
}
