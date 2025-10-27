import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/features/products/presentation/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

import '../../data/category_model.dart';

class Product_Categories_Items extends StatelessWidget {
  const Product_Categories_Items({super.key, required this.categoryModel});
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductListScreen.name,
          arguments: categoryModel.title,
        );
      },
      child: Column(
        spacing: 6,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.themeColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.network(
              categoryModel.icon,
              height: 32,
              width: 32,
              errorBuilder: (_, __, ___) {
                return Icon(Icons.error_outline, size: 32);
              },
            ),
          ),
          Text(
            categoryModel.title,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: AppColors.themeColor),
          ),
        ],
      ),
    );
  }
}
