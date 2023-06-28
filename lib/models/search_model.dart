
import 'package:flutter/cupertino.dart';

class SearchModel with ChangeNotifier {
  String productName,
      productImage;

  SearchModel({
    required this.productName,
    required this.productImage,
  });

  factory SearchModel.fromJson(dynamic json){

    return SearchModel(
      productName: json['product_name'] ?? "",
      productImage: json['product_img'] ?? "https://img.freepik.com/premium-vector/shopping-cart-with-cross-mark-wireless-paymant-icon-shopping-bag-failure-paymant-sign-online-shopping-vector_662353-912.jpg",

    );
  }
  static List<SearchModel> searchItemsFromSnapshot (List itemsFromSnapshot){
    return itemsFromSnapshot.map((json) {
      return SearchModel.fromJson(json);
    }).toList();
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = {};
    data['product_name'] = productName;
    data['product_img'] = productImage;

    return data;
  }
}
