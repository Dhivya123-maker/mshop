import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mshop/const/api.dart';
import 'package:mshop/models/category_model.dart';
import 'package:mshop/models/search_model.dart';

class CategoryApiServices{
  static Future<List<CategoryModel>> getItemCategories() async{

    try{
      var uri = Uri.http(BASEURL,CATEGORY_API_PATH);
      var response = await http.get(uri);
      Map data = jsonDecode(response.body);

      List categoryTempList = [];
      for(var c in data['master_list']){
        categoryTempList.add(c);

      }
      return CategoryModel.itemsFromSnapshot(categoryTempList);
    }catch(error){
      throw error.toString();
    }
  }


  static Future<List<SearchModel>> searchItems({required String query}) async {
    try {
      var uri = Uri.http(BASEURL,SERACH_API_PATH + query);
      var response = await http.get(uri);
      Map data = json.decode(response.body);
      List searchList =[];

      for(var s in data['results']){
        searchList.add(s);
      }
      return SearchModel.searchItemsFromSnapshot(searchList);

    } catch (error) {
      throw error.toString();
    }
  }


}

