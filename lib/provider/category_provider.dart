import 'package:flutter/cupertino.dart';
import 'package:mshop/models/category_model.dart';
import 'package:mshop/models/search_model.dart';
import 'package:mshop/services/category_api_service.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryModel> categoryList = [];

  List<CategoryModel> get getcategoryList {
    return categoryList;
  }

  List<SearchModel> searchList = [];

  List<SearchModel> get getSearchList {
    return searchList;
  }


  Future<List<CategoryModel>> fetchAllCategories() async{
    categoryList = await CategoryApiServices.getItemCategories();
    return categoryList;

  }
  Future<List<SearchModel>> searchItems({required String query}) async{
    searchList = await CategoryApiServices.searchItems(query: query);
    return searchList;
  }


}

