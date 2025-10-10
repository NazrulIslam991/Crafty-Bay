import 'package:crafty_bay/features/shared/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.categoryName});

  static const String name = '/product_list';
  final String categoryName;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.categoryName)),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 8,
          crossAxisCount: 3,
          childAspectRatio: 5 / 5,
          //crossAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          return FittedBox(child: ProductCard());
        },
        itemCount: 10,
      ),
    );
  }
}
