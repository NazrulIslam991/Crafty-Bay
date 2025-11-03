import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/app/constants/constants.dart';
import 'package:crafty_bay/features/products/presentation/screens/product_details_screen.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/snackbar_messege.dart';
import 'package:crafty_bay/features/wishlist/data/models/wishlist_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/wish_list_controller.dart';

class WishCard extends StatelessWidget {
  const WishCard({super.key, required this.wishlistModel});

  final WishlistModel wishlistModel;

  @override
  Widget build(BuildContext context) {
    final product = wishlistModel.product;
    final WishlistController controller = Get.find();

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDetailsScreen.name,
          arguments: product.id,
        );
      },
      child: Stack(
        children: [
          Card(
            color: Colors.white,
            elevation: 2,
            shadowColor: AppColors.themeColor.withOpacity(0.2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: SizedBox(
              width: 140,
              child: Column(
                children: [
                  // Product image
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.themeColor.withOpacity(0.1),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    child: Image.network(
                      product.photos.isNotEmpty ? product.photos.first : '',
                      height: 80,
                      width: 140,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => const Icon(
                        Icons.image_not_supported_outlined,
                        size: 48,
                        color: Colors.grey,
                      ),
                    ),
                  ),

                  // Product info
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          maxLines: 1,
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '$takaSign${product.currentPrice}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.themeColor,
                              ),
                            ),
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                const Icon(
                                  Icons.star,
                                  size: 18,
                                  color: Colors.amber,
                                ),
                                Text(
                                  '4.5',
                                  style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Delete Icon
          Positioned(
            top: 4,
            right: 4,
            child: GestureDetector(
              onTap: () async {
                bool success = await controller.deleteProductFromWishlist(
                  wishlistModel.id,
                );
                if (success) {
                  showSnackBarMessege(context, 'Removed from wishlist');
                } else {
                  showSnackBarMessege(context, 'Failed to remove');
                }
              },
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(
                  Icons.delete_forever_outlined,
                  size: 20,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
