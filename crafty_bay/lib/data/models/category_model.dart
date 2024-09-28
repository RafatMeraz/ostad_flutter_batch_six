class CategoryModel {
  int? id;
  String? categoryName;
  String? categoryImg;
  String? createdAt;
  String? updatedAt;

  CategoryModel(
      {this.id,
      this.categoryName,
      this.categoryImg,
      this.createdAt,
      this.updatedAt});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['categoryName'];
    categoryImg = json['categoryImg'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
