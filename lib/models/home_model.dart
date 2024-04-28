class HomeModel {
  late final bool? status;
  final String? message;
  final DataModel? data;

  HomeModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory HomeModel.fromJSON(Map<String, dynamic> json) {
    return HomeModel(
        status: json["status"],
        message: json["message"],
        data: json['data'] != null ? DataModel.fromJSON(json['data']) : null,);
  }
}

class DataModel {
  List<BannersModel> banners = [];
  List<ProductsModel> products = [];
  DataModel({
    required this.banners,
    required this.products,
  });

  factory DataModel.fromJSON(Map<String, dynamic> json) {
     List<BannersModel> banners = [];
     List<ProductsModel> products = [];
    if (json['banners'] != null) {
      json['banners'].forEach((element) {
        banners.add(BannersModel.fromJSON(element));
      });
    }
    if (json['products'] != null) {
      json['products'].forEach((element) {
        products.add(ProductsModel.fromJSON(element));
      });
    }

    return DataModel(
      banners: banners,
      products: products,
    );
  }
}

class BannersModel {
  final int? id;
  final String? image;

  BannersModel({required this.id, required this.image});
  factory BannersModel.fromJSON(Map<String, dynamic> json) {
    return BannersModel(
      id: json['id'],
      image: json['image'],
    );
  }
}

class ProductsModel {
  final int? id;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String? image;
  final String? name;
  final String? description;
  final List<String>? images;
  final bool? inFavorites;
  final bool? inCart;

  ProductsModel({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });
  factory ProductsModel.fromJSON(Map<String, dynamic> json) {
    return ProductsModel(
      id: json['id'],
      price: json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
      images: List<String>.from(json['images'].map((e) => e)),
      inFavorites: json['in_favorites'],
      inCart: json['in_cart'],
    );
  }
}
