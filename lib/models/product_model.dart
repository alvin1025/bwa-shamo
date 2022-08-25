
import 'package:sneakerz/models/category_model.dart';
import 'package:sneakerz/models/gallery_model.dart';

class ProductModel {
  int? id;
  String? name;
  double? price;
  String? description;
  String? tags;
  CategoryModel? category;
  DateTime? createAt;
  DateTime? updatedAt;
  List<GalleryModel>? galleries;

  ProductModel(
      {this.id,
      this.name,
      this.price,
      this.description,
      this.tags,
      this.category,
      this.createAt,
      this.updatedAt,
      this.galleries});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = double.parse(json['price'].toString());
    description = json['description'];
    tags = json['tags'];
    category = CategoryModel.fromJson(json['category']);
    galleries = json['galleries']
        .map<GalleryModel>((gallery) => GalleryModel.fromJson(gallery))
        .toList();
    createAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
  }

  Map<String, dynamic> toJson(){
    return{
      'id': id,
      'name': name,
      'price': price,
      'description' : description,
      'tags': tags,
      'category': category?.toJson(),
      'galleries': galleries?.map((gallery) => gallery.toJson).toList(),
      'created_at': createAt.toString(),
      'updated_at': updatedAt.toString()
    };
  }
}

class UninitializedProductModel extends ProductModel{

}
