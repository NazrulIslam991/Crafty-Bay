import 'package:crafty_bay/app/app_color.dart';
import 'package:flutter/material.dart';

class IncreDecreButton extends StatefulWidget {
  const IncreDecreButton({super.key, required this.onChange});

  final Function(int) onChange;

  @override
  State<IncreDecreButton> createState() => _IncreDecreButtonState();
}

class _IncreDecreButtonState extends State<IncreDecreButton> {
  int _intCurrentValue = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: [
        _buildButton(Icons.add, () {
          _intCurrentValue++;
          widget.onChange(_intCurrentValue);
          setState(() {});
        }),
        Text(
          _intCurrentValue.toString(),
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        _buildButton(Icons.remove, () {
          if (_intCurrentValue > 1) {
            _intCurrentValue--;
            widget.onChange(_intCurrentValue);
            setState(() {});
          }
        }),
      ],
    );
  }

  GestureDetector _buildButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.themeColor,
          borderRadius: BorderRadius.circular(2),
        ),
        child: Padding(
          padding: EdgeInsets.all(4),
          child: Icon(icon, color: Colors.white, size: 18),
        ),
      ),
    );
  }
}
