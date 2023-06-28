
import 'package:flutter/material.dart';
import 'package:mshop/models/category_model.dart';
import 'package:mshop/widgets/appbar_widget.dart';
import 'package:mshop/widgets/sub_category_widget.dart';
import 'package:provider/provider.dart';

class SubCategoryScreen extends StatefulWidget {
  const SubCategoryScreen({Key? key, required this.categoryModel}) : super(key: key);

 final  CategoryModel categoryModel;

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: MyAppBar(),
        body:  Column(
            children: [
                     Expanded(
                      child:  GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 3.0,
                        mainAxisSpacing:3.0,
                        shrinkWrap: true,
                        children: List.generate(widget.categoryModel.subcategory.length, (index) {
                             return ChangeNotifierProvider.value(
                            value : widget.categoryModel.subcategory[index],
                            child: const SubCategoryWidget(),
                          );
                        },),
                      ),
                    )
                  // }),
            ],

        ),
      ),
    );
  }
}
