
import 'package:flutter/cupertino.dart';

class SubCategoryModel with ChangeNotifier {
  String displayName,
      displayImage;

  SubCategoryModel({
    required this.displayName,
    required this.displayImage,
  });

  factory SubCategoryModel.fromJson(dynamic json){

    return SubCategoryModel(
      displayName: json["display_name"] ?? "",
      displayImage: json['display_image'] ?? "https://img.freepik.com/premium-vector/shopping-cart-with-cross-mark-wireless-paymant-icon-shopping-bag-failure-paymant-sign-online-shopping-vector_662353-912.jpg",
    );
  }
  static List<SubCategoryModel> itemsFromSnapshot (List itemsFromSnapshot){
    return itemsFromSnapshot.map((json) {
      return SubCategoryModel.fromJson(json);
    }).toList();
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = {};
    data["display_name"] = displayName;
    data["display_image"] = displayImage;

    return data;
  }
}