import 'package:crafty_bay/app/controller/auth_controller.dart';
import 'package:crafty_bay/app/craftybay.dart';
import 'package:crafty_bay/core/services/network_caller.dart';
import 'package:crafty_bay/features/auth/presentaion/screens/sign_in_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

NetworkCaller SetUpNetworkClient() {
  return NetworkCaller(
    onUnAuthorize: _onUnAuthorized,
    accessToken: () {
      return Get.find<AuthController>().accessToken ?? '';
    },
  );
}

Future<void> _onUnAuthorized() async {
  // todo
  Navigator.pushNamedAndRemoveUntil(
    Craftybay.navigatorkey.currentContext!,
    SignInScreen.name,
    (predicate) => false,
  );
}
