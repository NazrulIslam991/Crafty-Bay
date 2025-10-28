import 'package:crafty_bay/features/shared/presentation/controller/category_controller.dart';
import 'package:crafty_bay/features/shared/presentation/controller/main_nav_controller.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/center_circular_progress.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/product_categories_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  final ScrollController _scrollController = ScrollController();
  final CategoryController _categoryCotroller = Get.find<CategoryController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.addListener(_loadMore);
    });
  }

  void _loadMore() {
    if (_scrollController.position.extentAfter < 400) {
      _categoryCotroller.getCategoryList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        BackToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Categories"),
          leading: BackButton(
            onPressed: () {
              BackToHome();
            },
          ),
        ),
        body: GetBuilder(
          init: _categoryCotroller,
          builder: (_) {
            if (_categoryCotroller.isInitialLoading) {
              return CenterCircularProgress();
            }
            return Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                children: [
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        _categoryCotroller.refreshCategoryList();
                      },
                      child: GridView.builder(
                        controller: _scrollController,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemBuilder: (context, index) {
                          return FittedBox(
                            child: Product_Categories_Items(
                              categoryModel:
                                  _categoryCotroller.categoryList[index],
                            ),
                          );
                        },
                        itemCount: _categoryCotroller.categoryList.length,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _categoryCotroller.getCategoryInProgress,
                    child: LinearProgressIndicator(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void BackToHome() {
    Get.find<MainNavController>().backToHome();
  }
}
