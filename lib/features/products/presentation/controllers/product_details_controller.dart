import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/core/model/network_respons.dart';
import 'package:crafty_bay/core/services/network_caller.dart';
import 'package:get/get.dart';

import '../../../shared/data/product_details_model.dart';

class ProductDetailsController extends GetxController {
  bool _getProductDetailsInProgress = false;
  ProductDetailsModel? _productDetailsModel;
  String? _errorMessege;
  bool get getProductDetailsInProgress => _getProductDetailsInProgress;
  ProductDetailsModel? get productDetails => _productDetailsModel;
  String? get errorMessege => _errorMessege;

  Future<bool> getProductDetails(String productId) async {
    bool isSuccess = false;
    _getProductDetailsInProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: Urls.prouctDetailsUrl(productId),
    );

    if (response.isSuccess) {
      _productDetailsModel = ProductDetailsModel.fromJson(
        response.body!['data'],
      );
      isSuccess = true;
      _errorMessege = null;
    } else {
      _errorMessege = response.errorMessage;
    }
    _getProductDetailsInProgress = false;
    update();
    return isSuccess;
  }
}
