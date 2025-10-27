import 'package:crafty_bay/app/setup_network_client.dart';
import 'package:crafty_bay/features/auth/presentaion/controller/signin_controller.dart';
import 'package:crafty_bay/features/auth/presentaion/controller/signup_controller.dart';
import 'package:crafty_bay/features/auth/presentaion/controller/verify_otp_controller.dart';
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
  }
}
