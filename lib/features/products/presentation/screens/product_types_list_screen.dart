import 'package:crafty_bay/features/shared/presentation/widgets/center_circular_progress.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../home/presentation/controller/prodduct_type_controller.dart';

class ProductTypeListScreen extends StatefulWidget {
  final String productType;

  const ProductTypeListScreen({super.key, required this.productType});

  static const String name = '/product_type_list';

  @override
  State<ProductTypeListScreen> createState() => _ProductTypeListScreenState();
}

class _ProductTypeListScreenState extends State<ProductTypeListScreen> {
  late final ProductTypeController _controller;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMore);

    _controller = Get.find<ProductTypeController>(tag: widget.productType);

    if (_controller.products.isEmpty) {
      _controller.fetchProducts();
    }
  }

  void _loadMore() {
    if (_scrollController.position.extentAfter < 400) {
      _controller.fetchProducts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.productType.toUpperCase())),
      body: GetBuilder<ProductTypeController>(
        init: _controller,
        builder: (controller) {
          if (controller.isInitialLoading) {
            return CenterCircularProgress();
          }
          if (controller.products.isEmpty) {
            return Center(child: Text("No products found"));
          }
          return Column(
            children: [
              Expanded(
                child: GridView.builder(
                  controller: _scrollController,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 8,
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    return FittedBox(
                      child: ProductCard(
                        productModel: controller.products[index],
                      ),
                    );
                  },
                  itemCount: controller.products.length,
                ),
              ),
              // Visibility(
              //   visible: controller.getProductInProgress,
              //   child: LinearProgressIndicator(),
              // ),
            ],
          );
        },
      ),
    );
  }
}
