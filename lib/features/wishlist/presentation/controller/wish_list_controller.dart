import 'package:crafty_bay/core/services/network_caller.dart';
import 'package:get/get.dart';

import '../../../../app/urls.dart';
import '../../data/models/wishlist_model.dart';

class WishlistController extends GetxController {
  bool _isLoading = false;
  bool _isInitialLoading = false;
  List<WishlistModel> _products = [];
  String? _errorMessage;

  List<WishlistModel> get products => _products;
  bool get isInitialLoading => _isInitialLoading;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<bool> fetchProducts() async {
    _isInitialLoading = _products.isEmpty;
    _isLoading = true;
    update();

    final response = await Get.find<NetworkCaller>().getRequest(
      url: Urls.WListListUrl,
    );

    if (response.isSuccess) {
      final data = response.body?['data']?['results'] as List<dynamic>? ?? [];
      _products = data.map((e) => WishlistModel.fromJson(e)).toList();
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
      _products = [];
    }

    _isLoading = false;
    _isInitialLoading = false;
    update();
    return response.isSuccess;
  }

  Future<void> refreshProducts() async {
    await fetchProducts();
  }

  Future<bool> deleteProductFromWishlist(String wishlistId) async {
    try {
      final response = await Get.find<NetworkCaller>().deleteRequest(
        url: Urls.removeWishlist(wishlistId),
      );
      if (response.isSuccess) {
        _products.removeWhere((item) => item.id == wishlistId);
        update();
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
