import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/features/products/presentation/controllers/product_details_controller.dart';
import 'package:crafty_bay/features/products/presentation/widgets/color_picker.dart';
import 'package:crafty_bay/features/products/presentation/widgets/product_image_slider.dart';
import 'package:crafty_bay/features/products/presentation/widgets/size_picker.dart';
import 'package:crafty_bay/features/products/presentation/widgets/total_price_and_cart_section.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/center_circular_progress.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/incre_decre_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../wishlist/presentation/controller/add_wishlist_controller.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  static const String name = '/product_details_screen';
  final String productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ProductDetailsController _productDetailsController =
      ProductDetailsController();
  final AddToWishlistController _wishlistController = AddToWishlistController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _productDetailsController.getProductDetails(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text('Product Details')),
      body: GetBuilder(
        init: _productDetailsController,
        builder: (controller) {
          if (controller.getProductDetailsInProgress) {
            return CenterCircularProgress();
          }
          if (controller.errorMessege != null) {
            return Center(child: Text(controller.errorMessege!));
          }

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ProductImageSlider(
                        imageUrls: controller.productDetails?.photos ?? [],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.productDetails?.title ?? '',
                                        style: textTheme.bodyLarge?.copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Wrap(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                size: 24,
                                                color: Colors.amber,
                                              ),
                                              Text(
                                                controller
                                                        .productDetails
                                                        ?.rating ??
                                                    '',
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ],
                                          ),
                                          TextButton(
                                            onPressed: () {},
                                            child: Text("Reviews"),
                                          ),

                                          /// Wishlist button
                                          GetBuilder(
                                            init: _wishlistController,
                                            builder: (_) {
                                              return Card(
                                                color: AppColors.themeColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                child: InkWell(
                                                  onTap: () async {
                                                    if (await _toggleWishlist(
                                                      controller
                                                          .productDetails!
                                                          .Id,
                                                    )) {
                                                      ScaffoldMessenger.of(
                                                        context,
                                                      ).showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            _wishlistController
                                                                    .isInWishlist
                                                                ? "Added to wishlist"
                                                                : "Removed from wishlist",
                                                          ),
                                                        ),
                                                      );
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                        context,
                                                      ).showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            _wishlistController
                                                                    .errorMessage ??
                                                                "Something went wrong",
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                          2.0,
                                                        ),
                                                    child: Icon(
                                                      _wishlistController
                                                              .isInWishlist
                                                          ? Icons.favorite
                                                          : Icons
                                                                .favorite_outline,
                                                      size: 24,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 80,
                                  child: IncreDecreButton(
                                    onChange: (int value) {},
                                  ),
                                ),
                              ],
                            ),
                            Visibility(
                              visible: (controller.productDetails?.colors ?? [])
                                  .isNotEmpty,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Color",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                            ColorPicker(
                              colors: controller.productDetails?.colors ?? [],
                              onSelected: (String color) {},
                            ),
                            const SizedBox(height: 8),

                            Visibility(
                              visible: (controller.productDetails?.sizes ?? [])
                                  .isNotEmpty,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Size",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            SizePicker(
                              size: controller.productDetails?.sizes ?? [],
                              onSelected: (String color) {},
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Description",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Text(
                              controller.productDetails?.description ?? '',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TotalPriceAndCartAction(productModel: controller.productDetails!),
            ],
          );
        },
      ),
    );
  }

  Future<bool> _toggleWishlist(String productId) async {
    return await _wishlistController.toggleWishlist(productId);
  }
}
