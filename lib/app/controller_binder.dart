import 'package:crafty_bay/app/setup_network_client.dart';
import 'package:crafty_bay/features/shared/presentation/controller/main_nav_controller.dart';
import 'package:get/get.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainNavController());
    Get.put(SetUpNetworkClient());
  }
}
