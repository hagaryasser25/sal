class CategoriesModel {
  final bool? status;
  final String? message;
  final CategoriesDataModel? data;

  CategoriesModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null
          ? CategoriesDataModel.fromJson(json['data'])
          : null,
    );
  }
}

class CategoriesDataModel {
  final String? currentPage;
  List<DataCategoriesModel> data = [];

  CategoriesDataModel({required this.currentPage, required this.data});

  factory CategoriesDataModel.fromJson(Map<String, dynamic> json) {
    List<DataCategoriesModel> data = [];
    if (json['data'] != null) {
      json['data'].forEach((element) {
        data.add(DataCategoriesModel.fromJson(element));
      });
    }
    return CategoriesDataModel(currentPage: json['currentPage'], data: data);
  }
}

class DataCategoriesModel {
  final int? id;
  final String? name;
  final String? image;

  DataCategoriesModel(
      {required this.id, required this.name, required this.image});

  factory DataCategoriesModel.fromJson(Map<String, dynamic> json) {
    return DataCategoriesModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}
