import 'package:crafty_bay/features/products/presentation/controllers/product_list_controller.dart';
import 'package:crafty_bay/features/shared/data/category_model.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/center_circular_progress.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.category});

  static const String name = '/product_list';
  final CategoryModel category;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ProductListController _productListController = ProductListController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(_loadMore);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _productListController.getProductListByCategories(widget.category.id);
    });
  }

  void _loadMore() {
    if (_scrollController.position.extentAfter < 400) {
      _productListController.getProductListByCategories(widget.category.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.category.title)),
      body: GetBuilder(
        init: _productListController,
        builder: (controller) {
          if (controller.isInitialLoading) {
            return CenterCircularProgress();
          }
          return Column(
            children: [
              Expanded(
                child: GridView.builder(
                  controller: _scrollController,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 8,
                    crossAxisCount: 3,
                    childAspectRatio: 5 / 5,
                    //crossAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    return FittedBox(
                      child: ProductCard(
                        productModel: controller.productList[index],
                      ),
                    );
                  },
                  itemCount: controller.productList.length,
                ),
              ),
              Visibility(
                visible: controller.getProductInProgress,
                child: LinearProgressIndicator(),
              ),
            ],
          );
        },
      ),
    );
  }
}
