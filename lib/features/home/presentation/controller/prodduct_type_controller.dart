import 'package:crafty_bay/core/services/network_caller.dart';
import 'package:crafty_bay/features/shared/data/product_model.dart';
import 'package:get/get.dart';

import '../../../../app/urls.dart';

class ProductTypeController extends GetxController {
  final String tag;

  ProductTypeController({required this.tag});

  int _currentPage = 0;
  int? _lastPageNo;
  final int _pageSize = 40;

  bool _isLoading = false;
  bool _isInitialLoading = false;

  List<ProductModel> _products = [];
  String? _errorMessage;

  List<ProductModel> get products => _products;
  bool get isInitialLoading => _isInitialLoading;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  String _getUrl() {
    switch (tag) {
      case "popular":
        return Urls.popularProducts(_currentPage, _pageSize);
      case "special":
        return Urls.specialProducts(_currentPage, _pageSize);
      case "new":
        return Urls.newProducts(_currentPage, _pageSize);
      default:
        return Urls.productList(_currentPage, _pageSize, "");
    }
  }

  Future<bool> fetchProducts() async {
    if (_currentPage > (_lastPageNo ?? 1)) return false;

    if (_currentPage == 0) {
      _products.clear();
      _isInitialLoading = true;
    } else {
      _isLoading = true;
    }

    update();

    _currentPage++;

    final response = await Get.find<NetworkCaller>().getRequest(url: _getUrl());

    if (response.isSuccess) {
      _lastPageNo = response.body!['data']['last_page'];
      List<ProductModel> list = [];
      for (Map<String, dynamic> json in response.body!['data']['results']) {
        list.add(ProductModel.fromJson(json));
      }
      _currentPage++;
      _products.addAll(list);
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }

    if (_isInitialLoading) {
      _isInitialLoading = false;
    } else {
      _isLoading = false;
    }

    update();
    return response.isSuccess;
  }

  Future<void> refreshProducts() async {
    _currentPage = 0;
    fetchProducts();
  }
}
