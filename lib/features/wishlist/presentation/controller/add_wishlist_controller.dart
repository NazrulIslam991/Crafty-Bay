import 'package:get/get.dart';

import '../../../../app/urls.dart';
import '../../../../core/model/network_respons.dart';
import '../../../../core/services/network_caller.dart';

class AddToWishlistController extends GetxController {
  bool _addToWishlistInProgress = false;
  String? _errorMessage;
  bool _isInWishlist = false;

  bool get addToWishlistInProgress => _addToWishlistInProgress;
  String? get errorMessage => _errorMessage;
  bool get isInWishlist => _isInWishlist;

  Future<bool> toggleWishlist(String productId) async {
    bool isSuccess = false;
    _addToWishlistInProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .postRequest(url: Urls.addToWListUrl, body: {'product': productId});

    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;
      _isInWishlist = !_isInWishlist;
    } else {
      _errorMessage = response.errorMessage;
    }

    _addToWishlistInProgress = false;
    update();

    return isSuccess;
  }
}
