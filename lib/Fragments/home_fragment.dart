import 'package:flutter/material.dart';
import 'package:mshop/models/category_model.dart';
import 'package:mshop/provider/category_provider.dart';
import 'package:mshop/widgets/categories_widget.dart';
import 'package:mshop/widgets/empty_category.dart';
import 'package:provider/provider.dart';

class HomeFragment extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    return Column(
      children: [
        FutureBuilder<List<CategoryModel>>(
            future:categoryProvider.fetchAllCategories() ,
            builder:  (context, snapshot){

              if(snapshot.connectionState == ConnectionState.waiting) {
                return const Expanded(child: Center(child:  CircularProgressIndicator()));
              }
              if(snapshot.hasError){
                return Expanded(
                    child: EmptyCategoryWidget(
                      text: "an error occured ${snapshot.error}",
                      imagePath: "assets/images/no_data.png",
                    ));
              }else if(snapshot.data == null){
                return const Expanded(
                    child: EmptyCategoryWidget(
                      text: "No data found",
                      imagePath: "assets/images/no_data.png",
                    ));
              }

              return Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 3.0,
                  mainAxisSpacing:3.0,
                  shrinkWrap: true,
                  children: List.generate(snapshot.data!.length, (index) {
                    return ChangeNotifierProvider.value(
                      value : snapshot.data![index],
                      child: const CategoriesWidget(),
                    );
                  },),
                ),
              );

            }),
      ],
    );
  }
}