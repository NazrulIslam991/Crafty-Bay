import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/features/products/presentation/widgets/color_picker.dart';
import 'package:crafty_bay/features/products/presentation/widgets/product_image_slider.dart';
import 'package:crafty_bay/features/products/presentation/widgets/size_picker.dart';
import 'package:crafty_bay/features/products/presentation/widgets/total_price_and_cart_section.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/incre_decre_button.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  static const String name = '/product_details_screen';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text('Product Details')),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductImageSlider(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      spacing: 8,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Nike A123 - New Edition of Jordan Sports",
                                    style: textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Wrap(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            size: 24,
                                            color: Colors.amber,
                                          ),
                                          Text(
                                            '4.2',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ],
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text("Reviews"),
                                      ),
                                      Card(
                                        color: AppColors.themeColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Icon(
                                            Icons.favorite_outline,
                                            size: 24,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 80,
                              child: IncreDecreButton(onChange: (int value) {}),
                            ),
                          ],
                        ),
                        Text("Color", style: TextStyle(fontSize: 18)),
                        ColorPicker(
                          colors: ['Red', "Black", "Blue", "White"],
                          onSelected: (String color) {},
                        ),

                        Text("Size", style: TextStyle(fontSize: 18)),
                        SizePicker(
                          size: ['S', "M", "L", "XL", "XXL"],
                          onSelected: (String color) {},
                        ),
                        const SizedBox(height: 8),
                        Text("Description", style: TextStyle(fontSize: 18)),
                        Text(
                          "Experience unmatched comfort and performance with the Nike Air Zoom Pegasus 40 — designed for runners who demand both style and speed. Featuring a lightweight mesh upper for breathability, dual Zoom Air units for responsive cushioning, and a durable rubber outsole for superior grip, this shoe adapts to your every stride. Whether you’re hitting the track, gym, or city streets, the Pegasus 40 keeps you moving in comfort and confidence.",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          TotalPriceAndCartAction(),
        ],
      ),
    );
  }
}
