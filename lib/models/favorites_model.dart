class FavoritesModel {
  final bool? status;
  final String? message;
  final FavoritesData? data;

  FavoritesModel(
      {required this.status, required this.message, required this.data});

  factory FavoritesModel.fromJson(Map<String, dynamic> json) {
    return FavoritesModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? FavoritesData.fromJson(json['data']) : null,
    );
  }
}

class FavoritesData {
  final int? current_page;
  List<ProductData> data = [];
  FavoritesData({required this.data, required this.current_page});

  factory FavoritesData.fromJson(Map<String, dynamic> json) {
    List<ProductData> data = [];

    if (json['data'] != null) {
      json['data'].forEach((element) {
        data.add(ProductData.fromJson(element));
      });
    }
    return FavoritesData(data: data, current_page: json['current_page']);
  }
}

class ProductData {
  final Product? product;
  final int? id;

  ProductData({required this.product, required this.id});

  factory ProductData.fromJson(Map<String, dynamic> json) {
    
    return ProductData(
      product: Product.fromJson(json['product']), 
      id: json['id']);
  }
}

class Product {
  final int? productId;
  final dynamic price;
  final dynamic old_price;
  final dynamic discount;
  final String? image;
  final String? name;

  Product(
      {required this.productId,
      required this.price,
      required this.old_price,
      required this.discount,
      required this.image,
      required this.name});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['id'],
      price: json['price'],
      old_price: json['old_price'],
      discount: json['discount'],
      image: json['image'],
      name: json['name'],
    );
  }
}
