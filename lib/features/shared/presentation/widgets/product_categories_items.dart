import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/features/products/presentation/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

class Product_Categories_Items extends StatelessWidget {
  const Product_Categories_Items({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductListScreen.name,
          arguments: "Electronic",
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
            child: Icon(Icons.computer, size: 32, color: AppColors.themeColor),
          ),
          Text(
            "Electronics",
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: AppColors.themeColor),
          ),
        ],
      ),
    );
  }
}
