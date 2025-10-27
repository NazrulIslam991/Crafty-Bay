import 'package:crafty_bay/app/craftybay.dart';
import 'package:crafty_bay/core/services/network_caller.dart';
import 'package:crafty_bay/features/auth/presentaion/screens/sign_in_screen.dart';
import 'package:flutter/cupertino.dart';

NetworkCaller SetUpNetworkClient() {
  return NetworkCaller(onUnAuthorize: _onUnAuthorized, accessToken: '');
}

Future<void> _onUnAuthorized() async {
  // todo
  Navigator.pushNamedAndRemoveUntil(
    Craftybay.navigatorkey.currentContext!,
    SignInScreen.name,
    (predicate) => false,
  );
}
