import 'package:flutter/material.dart';

void showSnackBarMessege(BuildContext context, String messege) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(messege)));
}
