import 'package:crafty_bay/features/cart/data/model/cart_item_model.dart';
import 'package:get/get.dart';

import '../../../../app/urls.dart';
import '../../../../core/model/network_respons.dart';
import '../../../../core/services/network_caller.dart';

class CartListController extends GetxController {
  bool _inProgress = false;

  List<CartItemModel> _cartItemList = [];
  bool get inProgress => _inProgress;

  List<CartItemModel> get cartItemList => _cartItemList;

  String? _errorMessege;
  String? get errorMessege => _errorMessege;

  Future<bool> getCartList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: Urls.CartListUrl,
    );
    if (response.isSuccess) {
      List<CartItemModel> list = [];
      for (Map<String, dynamic> jsonData in response.body!['data']['results']) {
        list.add(CartItemModel.fromJson(jsonData));
      }
      _cartItemList = list;

      isSuccess = true;
      _errorMessege = null;
    } else {
      _errorMessege = response.errorMessage;
    }
    _inProgress = false;
    update();

    return isSuccess;
  }

  int get totalPrice {
    int total = 0;
    for (CartItemModel item in _cartItemList) {
      total += (item.quantity * item.productModel.currentPrice);
    }
    return total;
  }

  void updateCart(String cartItemId, int quantity) {
    _cartItemList.firstWhere((item) => item.id == cartItemId).quantity =
        quantity;
    update();
  }

  Future<void> deleteCartItem(String cartItemId) async {
    _inProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .deleteRequest(url: Urls.deleteCartUrl(cartItemId));

    if (response.isSuccess) {
      _cartItemList.removeWhere((item) => item.id == cartItemId);
      _errorMessege = null;
    } else {
      _errorMessege = response.errorMessage;
    }
    _inProgress = false;
    update();
  }
}
