import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mshop/const/utils.dart';
import 'package:mshop/screens/SearchScreen.dart';
import 'package:page_transition/page_transition.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final PreferredSizeWidget? bottom;

  const MyAppBar({super.key, this.bottom});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: color),
        elevation: 1,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title : Text(
          "mShop",
          style: GoogleFonts.lobster(
              textStyle: TextStyle(
                color: color,
                fontSize: 20,
                letterSpacing: 0.6,
              )
          ),
        ),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: const SearchScreen(),
                    isIos: true,
                  ),
                );
              },
              icon: const Icon(IconlyLight.search)
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => bottom == null ? Size(56, AppBar().preferredSize.height)
      : Size(56, 80 + AppBar().preferredSize.height);
}
