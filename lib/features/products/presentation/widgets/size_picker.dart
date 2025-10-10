import 'package:crafty_bay/app/app_color.dart';
import 'package:flutter/material.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({super.key, required this.onSelected, required this.size});

  final List<String> size;
  final Function(String) onSelected;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  String? _selectedSize;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 8,
        children: widget.size.map((size) {
          return GestureDetector(
            onTap: () {
              _selectedSize = size;
              widget.onSelected(size);
              setState(() {});
            },
            child: CircleAvatar(
              backgroundColor: _selectedSize == size
                  ? AppColors.themeColor
                  : Colors.grey.shade300,
              child: FittedBox(
                child: Text(
                  size,
                  style: TextStyle(
                    color: _selectedSize == size ? Colors.white : null,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
