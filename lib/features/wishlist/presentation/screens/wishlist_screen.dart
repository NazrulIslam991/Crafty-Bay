import 'package:crafty_bay/features/shared/presentation/widgets/center_circular_progress.dart';
import 'package:crafty_bay/features/wishlist/presentation/widget/wish_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/presentation/controller/main_nav_controller.dart';
import '../controller/wish_list_controller.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});
  static const String name = '/wish_list_screen';

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final WishlistController _controller = Get.put(WishlistController());
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMore);
    _controller.fetchProducts();
  }

  void _loadMore() {
    if (_scrollController.position.extentAfter < 400 &&
        !_controller.isLoading) {
      _controller.fetchProducts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        BackToCart();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Wishlist'),
          leading: BackButton(
            onPressed: () {
              BackToCart();
            },
          ),
        ),
        body: GetBuilder<WishlistController>(
          builder: (controller) {
            if (controller.isInitialLoading) {
              return const CenterCircularProgress();
            }

            if (controller.products.isEmpty) {
              return const Center(child: Text("No products found"));
            }

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: controller.refreshProducts,
                      child: GridView.builder(
                        controller: _scrollController,
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(8),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              crossAxisCount: 3,
                              childAspectRatio: 0.7,
                            ),
                        itemCount: controller.products.length,
                        itemBuilder: (context, index) {
                          return WishCard(
                            wishlistModel: controller.products[index],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void BackToCart() {
    Get.find<MainNavController>().moveToCart();
  }
}
