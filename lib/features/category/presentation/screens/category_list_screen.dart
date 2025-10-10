import 'package:crafty_bay/features/shared/presentation/controller/main_nav_controller.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/product_categories_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
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
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              return FittedBox(child: Product_Categories_Items());
            },
            itemCount: 10,
          ),
        ),
      ),
    );
  }

  void BackToHome() {
    Get.find<MainNavController>().backToHome();
  }
}
