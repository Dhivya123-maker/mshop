import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mshop/const/utils.dart';
import 'package:mshop/models/search_model.dart';
import 'package:provider/provider.dart';

class SearchCategoryWidget extends StatelessWidget {
  const SearchCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final searchCategoryModelProvider = Provider.of<SearchModel>(context);

    Size size = Utils(context).getScreenSize;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){
           var snackBar = SnackBar(content: Text(searchCategoryModelProvider.productName + " is added in the cart"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },

        child: Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(6),
                  child: Column(
                    children: [
                       Hero(
                          tag: searchCategoryModelProvider,
                          child : FancyShimmerImage(
                            height: size.height*0.14,
                            width: size.width,
                            boxFit: BoxFit.contain,
                            errorWidget: Image.asset('assets/images/empty_image.png'),
                            imageUrl: searchCategoryModelProvider.productImage,
                          ),
                      ),
                      const SizedBox(height: 7,),
                      Text(
                        searchCategoryModelProvider.productName.toLowerCase(),
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