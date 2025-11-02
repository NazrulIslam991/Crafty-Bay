import 'package:crafty_bay/app/assets_path.dart';
import 'package:crafty_bay/features/home/presentation/controller/home_slide_controller.dart';
import 'package:crafty_bay/features/home/presentation/widgets/app_bar_icon_button.dart';
import 'package:crafty_bay/features/home/presentation/widgets/home_banner_slider.dart';
import 'package:crafty_bay/features/products/presentation/screens/product_types_list_screen.dart';
import 'package:crafty_bay/features/shared/presentation/controller/category_controller.dart';
import 'package:crafty_bay/features/shared/presentation/controller/main_nav_controller.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/center_circular_progress.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/product_categories_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../shared/presentation/widgets/product_card.dart';
import '../controller/prodduct_type_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CategoryController _categoryCotroller = Get.find<CategoryController>();
  final ProductTypeController _newController = Get.find(tag: "new");
  final ProductTypeController _specialController = Get.find(tag: "special");
  final ProductTypeController _popularController = Get.find(tag: "popular");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SvgPicture.asset(AssetPaths.logoNavSvg),
        actions: [
          AppBarIconButton(onTap: () {}, iconData: Icons.person),
          AppBarIconButton(onTap: () {}, iconData: Icons.call),
          AppBarIconButton(
            onTap: () {},
            iconData: Icons.notifications_on_outlined,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 16),
              _buildSearchBar(),
              SizedBox(height: 16),
              GetBuilder<HomeSlideController>(
                builder: (controller) {
                  if (controller.getSliderInProgress) {
                    return SizedBox(
                      height: 180,
                      child: CenterCircularProgress(),
                    );
                  }
                  return homeBannerSlider(sliders: controller.sliders);
                },
              ),
              SizedBox(height: 16),
              _buildSetionHeader(
                title: 'Categories',
                onTapSeeAll: () {
                  Get.find<MainNavController>().moveToCategory();
                },
              ),

              _buildCategoriesList(),

              _buildSetionHeader(
                title: 'New',
                onTapSeeAll: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductTypeListScreen(productType: "new"),
                    ),
                  );
                },
              ),
              _buildNewProductList(),
              _buildSetionHeader(
                title: 'Special',
                onTapSeeAll: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          ProductTypeListScreen(productType: "special"),
                    ),
                  );
                },
              ),

              _buildSpecialProductList(),
              _buildSetionHeader(
                title: 'Popular',
                onTapSeeAll: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          ProductTypeListScreen(productType: "popular"),
                    ),
                  );
                },
              ),
              _buildPopularProductList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoriesList() {
    return SizedBox(
      height: 100,
      child: GetBuilder<CategoryController>(
        builder: (controller) {
          if (controller.isInitialLoading) {
            return CenterCircularProgress();
          }
          return ListView.separated(
            itemCount: controller.categoryList.length > 10
                ? 10
                : controller.categoryList.length,
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Product_Categories_Items(
                categoryModel: controller.categoryList[index],
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 10);
            },
          );
        },
      ),
    );
  }

  Widget _buildSetionHeader({
    required String title,
    required VoidCallback onTapSeeAll,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        TextButton(onPressed: onTapSeeAll, child: Text("See all")),
      ],
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      onSubmitted: (String? text) {},
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: Colors.grey.shade100,
        filled: true,
        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
        prefixIcon: Icon(Icons.search),
      ),
    );
  }

  Widget _buildNewProductList() {
    if (_newController.products.isEmpty) {
      _newController.fetchProducts();
    }

    return SizedBox(
      height: 200,
      child: GetBuilder<ProductTypeController>(
        init: _newController,
        builder: (controller) {
          if (controller.isInitialLoading) {
            return CenterCircularProgress();
          }
          if (controller.products.isEmpty) {
            return Center(child: Text("No products found"));
          }
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.products.length > 6
                ? 6
                : controller.products.length,
            itemBuilder: (context, index) {
              return ProductCard(productModel: controller.products[index]);
            },
          );
        },
      ),
    );
  }

  Widget _buildSpecialProductList() {
    if (_specialController.products.isEmpty) {
      _specialController.fetchProducts();
    }

    return SizedBox(
      height: 200,
      child: GetBuilder<ProductTypeController>(
        init: _specialController,
        builder: (controller) {
          if (controller.isInitialLoading) {
            return CenterCircularProgress();
          }
          if (controller.products.isEmpty) {
            return Center(child: Text("No products found"));
          }
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.products.length > 6
                ? 6
                : controller.products.length,
            itemBuilder: (context, index) {
              return ProductCard(productModel: controller.products[index]);
            },
          );
        },
      ),
    );
  }

  Widget _buildPopularProductList() {
    if (_popularController.products.isEmpty) {
      _popularController.fetchProducts();
    }

    return SizedBox(
      height: 200,
      child: GetBuilder<ProductTypeController>(
        init: _popularController,
        builder: (controller) {
          if (controller.isInitialLoading) {
            return CenterCircularProgress();
          }
          if (controller.products.isEmpty) {
            return Center(child: Text("No products found"));
          }
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.products.length > 6
                ? 6
                : controller.products.length,
            itemBuilder: (context, index) {
              return ProductCard(productModel: controller.products[index]);
            },
          );
        },
      ),
    );
  }
}
