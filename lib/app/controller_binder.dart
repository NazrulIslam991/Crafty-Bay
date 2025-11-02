import 'package:crafty_bay/app/setup_network_client.dart';
import 'package:crafty_bay/features/auth/presentaion/controller/signin_controller.dart';
import 'package:crafty_bay/features/auth/presentaion/controller/signup_controller.dart';
import 'package:crafty_bay/features/auth/presentaion/controller/verify_otp_controller.dart';
import 'package:crafty_bay/features/cart/presentation/controller/cart_list_controller.dart';
import 'package:crafty_bay/features/home/presentation/controller/home_slide_controller.dart';
import 'package:crafty_bay/features/home/presentation/controller/prodduct_type_controller.dart';
import 'package:crafty_bay/features/shared/presentation/controller/category_controller.dart';
import 'package:crafty_bay/features/shared/presentation/controller/main_nav_controller.dart';
import 'package:get/get.dart';

import 'controller/auth_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainNavController());
    Get.put(SetUpNetworkClient());
    Get.put(SignUpController());
    Get.put(VerifyOtpController());
    Get.put(SignInController());
    Get.put(AuthController());
    Get.put(HomeSlideController());
    Get.put(CategoryController());
    Get.put(CartListController());
    Get.put(ProductTypeController(tag: "popular"), tag: "popular");
    Get.put(ProductTypeController(tag: "new"), tag: "new");
    Get.put(ProductTypeController(tag: "special"), tag: "special");
  }
}
