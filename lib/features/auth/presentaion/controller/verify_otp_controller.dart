import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/core/model/network_respons.dart';
import 'package:crafty_bay/core/services/network_caller.dart';
import 'package:crafty_bay/features/auth/data/models/verify_otp_request_model.dart';
import 'package:crafty_bay/features/shared/data/models.dart';
import 'package:get/get.dart';

class VerifyOtpController extends GetxController {
  bool _verifyOtpInProgress = false;
  String? _errorMessage;
  UserModel? _userModel;
  String? _accessToken;

  String? get errorMessage => _errorMessage;

  bool get verifyOtpInProgress => _verifyOtpInProgress;

  UserModel? get userModel => _userModel;

  String? get accessToken => _accessToken;

  Future<bool> verifyOtp(VerifyOtpRequestModel model) async {
    bool isSuccess = false;
    _verifyOtpInProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>()
        .postRequest(url: Urls.verifyOtpUrl, body: model.toJson());

    if (response.isSuccess) {
      _errorMessage = null;
      _userModel = UserModel.fromJson(response.body!['data']['user']);
      _accessToken = response.body!['data']['token'];
      isSuccess = true;
    } else {
      _errorMessage = response.body?['msg'] ?? response.errorMessage;
    }
    _verifyOtpInProgress = false;
    update();

    return isSuccess;
  }
}
