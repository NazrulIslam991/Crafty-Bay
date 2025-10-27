import 'package:crafty_bay/features/auth/data/models/sign_in_request_model.dart';
import 'package:get/get.dart';

import '../../../../app/urls.dart';
import '../../../../core/model/network_respons.dart';
import '../../../../core/services/network_caller.dart';
import '../../../shared/data/user_model.dart';

class SignInController extends GetxController {
  bool _LogInProgress = false;

  String? _errorMessage;
  UserModel? _userModel;
  String? _accessToken;

  String? get errorMessage => _errorMessage;

  bool get logInProgress => _LogInProgress;

  UserModel? get userModel => _userModel;

  String? get accessToken => _accessToken;

  Future<bool> logIn(SignInRequestModel model) async {
    bool isSuccess = false;
    _LogInProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>()
        .postRequest(url: Urls.loginUrl, body: model.toJson());

    if (response.isSuccess) {
      _errorMessage = null;
      _errorMessage = null;
      _userModel = UserModel.fromJson(response.body!['data']['user']);
      _accessToken = response.body!['data']['token'];
      isSuccess = true;
    } else {
      _errorMessage = response.body?['msg'] ?? response.errorMessage;
    }
    _LogInProgress = false;
    update();

    return isSuccess;
  }
}
