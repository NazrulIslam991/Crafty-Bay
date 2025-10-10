import 'package:flutter/material.dart';

class AppBarIconButton extends StatelessWidget {
  ////////////////////////////////
  const AppBarIconButton({
    super.key,
    required this.onTap,
    required this.iconData,
  });

  final VoidCallback onTap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: CircleAvatar(
          radius: 14,
          backgroundColor: Colors.grey.shade200,
          child: Icon(iconData, color: Colors.grey, size: 16),
        ),
      ),
    );
  }
}
