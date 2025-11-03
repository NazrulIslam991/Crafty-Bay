class WishlistModel {
  final String id;
  final WishProductModel product;

  WishlistModel({required this.id, required this.product});

  factory WishlistModel.fromJson(Map<String, dynamic> json) {
    return WishlistModel(
      id: json['_id'] ?? '',
      product: WishProductModel.fromJson(json['product'] ?? {}),
    );
  }
}

class WishProductModel {
  final String id;
  final String title;
  final dynamic brand;
  final List<String> categories;
  final String slug;
  final String? metaDescription;
  final String description;
  final List<String> photos;
  final int currentPrice;
  final int quantity;

  WishProductModel({
    required this.id,
    required this.title,
    required this.brand,
    required this.categories,
    required this.slug,
    this.metaDescription,
    required this.description,
    required this.photos,
    required this.currentPrice,
    required this.quantity,
  });

  factory WishProductModel.fromJson(Map<String, dynamic> json) {
    dynamic brand;
    if (json['brand'] is String) {
      brand = json['brand'];
    } else if (json['brand'] is Map<String, dynamic>) {
      brand = json['brand']['title'] ?? '';
    } else {
      brand = '';
    }

    return WishProductModel(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      brand: brand,
      categories: json['categories'] != null
          ? List<String>.from(json['categories'])
          : [],
      slug: json['slug'] ?? '',
      metaDescription: json['meta_description'],
      description: json['description'] ?? '',
      photos: json['photos'] != null ? List<String>.from(json['photos']) : [],
      currentPrice: json['current_price'] ?? 0,
      quantity: json['quantity'] ?? 1,
    );
  }
}
