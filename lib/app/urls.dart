class Urls {
  static const String _baseUrl = 'https://ecom-rs8e.onrender.com/api';
  static const String signUpUrl = '$_baseUrl/auth/signup';
  static const String loginUrl = '$_baseUrl/auth/login';
  static const String verifyOtpUrl = '$_baseUrl/auth/verify-otp';
  static const String homeSliderUrl = '$_baseUrl/slides';
  static const String CartListUrl = '$_baseUrl/cart';
  static const String addToCartUrl = '$_baseUrl/cart';
  static String categoryList(int pageNo, int pageSize) =>
      '$_baseUrl/categories?count=$pageSize&page=$pageNo';
  static String productList(int pageNo, int pageSize, String categoryId) =>
      '$_baseUrl/products?count=$pageSize&page=$pageNo&category=$categoryId';

  static String prouctDetailsUrl(String productId) =>
      '$_baseUrl/products/id/$productId';

  static String deleteCartUrl(String cartItemId) =>
      '$_baseUrl/cart/$cartItemId';

  static String popularProducts(int pageNo, int pageSize) =>
      '$_baseUrl/products?count=$pageSize&page=$pageNo&tag=popular';

  static String specialProducts(int pageNo, int pageSize) =>
      '$_baseUrl/products?count=$pageSize&page=$pageNo&tag=special';

  static String newProducts(int pageNo, int pageSize) =>
      '$_baseUrl/products?count=$pageSize&page=$pageNo&tag=new';
}
