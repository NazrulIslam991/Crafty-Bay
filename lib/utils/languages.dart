import 'package:crafty_bay/lan/bn_bd.dart';
import 'package:crafty_bay/lan/en_us.dart';
import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': English,
    'bn_BD': Bangla,
  };
}
