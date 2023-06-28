import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mshop/const/utils.dart';
import 'package:mshop/models/sub_category_model.dart';
import 'package:provider/provider.dart';

class SubCategoryWidget extends StatelessWidget {
  const SubCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final subcategoryModelProvider = Provider.of<SubCategoryModel>(context);

    Size size = Utils(context).getScreenSize;
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child : Hero(
                        tag: subcategoryModelProvider,
                        child : FancyShimmerImage(
                          height: size.height*0.14,
                          width: size.width,
                          boxFit: BoxFit.cover,
                          errorWidget: Image.asset('assets/images/empty_image.png'),
                          imageUrl: subcategoryModelProvider.displayImage,
                        ),
                      ),
                    ),
                    const SizedBox(height: 7,),
                    Text(
                      subcategoryModelProvider.displayName,
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
    );
  }
}