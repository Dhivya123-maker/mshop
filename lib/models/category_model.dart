
import 'package:flutter/cupertino.dart';
import 'package:mshop/models/sub_category_model.dart';

class CategoryModel with ChangeNotifier {
  String displayName, displayImage;
  List<SubCategoryModel> subcategory;

  CategoryModel({
    required this.displayName,
    required this.displayImage,
    required this.subcategory,
  });

  factory CategoryModel.fromJson(dynamic json){

    return CategoryModel(
      subcategory: SubCategoryModel.itemsFromSnapshot(json['sub_category']),
      displayName: json["display_name"] ?? "",
      displayImage: json['display_image'] ?? "https://img.freepik.com/premium-vector/shopping-cart-with-cross-mark-wireless-paymant-icon-shopping-bag-failure-paymant-sign-online-shopping-vector_662353-912.jpg",
    );
  }
  static List<CategoryModel> itemsFromSnapshot (List itemsFromSnapshot){
    return itemsFromSnapshot.map((json) {
      return CategoryModel.fromJson(json);
    }).toList();
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = {};
    data["display_name"] = displayName;
    data["display_image"] = displayImage;

    return data;
  }
}