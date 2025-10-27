import 'package:crafty_bay/app/assets_path.dart';
import 'package:crafty_bay/features/home/presentation/controller/home_slide_controller.dart';
import 'package:crafty_bay/features/home/presentation/widgets/app_bar_icon_button.dart';
import 'package:crafty_bay/features/home/presentation/widgets/home_banner_slider.dart';
import 'package:crafty_bay/features/shared/presentation/controller/main_nav_controller.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/center_circular_progress.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/product_card.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/product_categories_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = '/home'; /////////////////////////////////////////

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                  Get.find<MainNavController>()
                      .moveToCategory(); /////////////////////////////////////
                },
              ),

              _buildCategoriesList(),

              _buildSetionHeader(title: 'New', onTapSeeAll: () {}),
              _buildNewProductList(),
              _buildSetionHeader(title: 'Special', onTapSeeAll: () {}),
              _buildSpecialProductList(),
              _buildSetionHeader(title: 'Popular', onTapSeeAll: () {}),
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
      child: ListView.separated(
        itemCount: 10,
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Product_Categories_Items();
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 10);
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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [1, 2, 3, 4, 5, 6].map((e) => ProductCard()).toList(),
      ),
    );
  }

  Widget _buildSpecialProductList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [1, 2, 3, 4, 5, 6].map((e) => ProductCard()).toList(),
      ),
    );
  }

  Widget _buildPopularProductList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [1, 2, 3, 4, 5, 6].map((e) => ProductCard()).toList(),
      ),
    );
  }
}
