import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mshop/const/utils.dart';
import 'package:mshop/models/category_model.dart';
import 'package:mshop/screens/sub_category_screen.dart';
import 'package:provider/provider.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});


  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final categoriesModelProvider = Provider.of<CategoryModel>(context);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(15),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SubCategoryScreen(categoryModel: categoriesModelProvider,)));
                },
                child: Column(
                  children: [
                   Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.all(6),
                        child: Column(
                          children: [
                            ClipRRect(
                             borderRadius: BorderRadius.circular(15),
                            child : Hero(
                              tag: categoriesModelProvider,
                              child : FancyShimmerImage(
                                    height: size.height*0.14,
                                    width: size.height,
                                    boxFit: BoxFit.cover,
                                    errorWidget: Image.asset('assets/images/empty_image.png'),
                                    imageUrl: categoriesModelProvider.displayImage,
                                    ),
                            ),
                             ),
                            const SizedBox(height: 7,),
                                  Text(
                                    categoriesModelProvider.displayName,
                                    textAlign: TextAlign.justify,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.montserrat(fontSize:13),
                                  ),
                          ],
                          ),

                   ),
                    ],

                  ),
              ),
            ),
          );
  }
}