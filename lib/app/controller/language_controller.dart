import 'dart:ui';

import 'package:get/get.dart';

class LanguageController extends GetxController {
  Locale _currentLocal = const Locale('en', 'US');
  final List<Locale> _supportedLocals = const [
    Locale('en', 'US'),
    Locale('bn', 'BD'),
  ];

  Locale get currentLocal => _currentLocal;

  List<Locale> get supportedLocals => _supportedLocals;

  void changeLocal(Locale local) {
    if (_currentLocal == local) return;

    _currentLocal = local;
    Get.updateLocale(local);
    update();
  }
}
