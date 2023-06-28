import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:mshop/Fragments/account_fragment.dart';
import 'package:mshop/Fragments/home_fragment.dart';
import 'package:mshop/Fragments/order_fragment.dart';
import 'package:mshop/widgets/appbar_widget.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       backgroundColor: Theme.of(context).backgroundColor.withOpacity(.99),
        appBar: const MyAppBar(),
        body:  PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index){
            _pageIndex = index;

          },
          children: [
            HomeFragment(),
            const AccountFragment(),
             OrderFragment(),

          ],
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          child: Container(
            color: Theme.of(context).canvasColor,
            child: Padding(
              padding: EdgeInsets.all(13),
              child: GNav(
                selectedIndex: _pageIndex,
                backgroundColor:Theme.of(context).canvasColor,
                color: Theme.of(context).colorScheme.secondary,
                tabBackgroundColor: Theme.of(context).splashColor,
                gap: 8,
                onTabChange: (index){
                  setState(() {
                    _pageIndex = index;
                     _pageController.jumpToPage(index);
                  });
                },
                padding: const EdgeInsets.all(15),
                tabs:const [
                 GButton(icon: IconlyLight.home,
                    text : "Home",
                  ),
                   GButton(icon: IconlyLight.profile,
                    text : "Account",),
                  GButton(icon: IconlyLight.activity,
                    text : "Order",),
                ],

              ),
            ),

          ),
        ),

        ),

    );
    
  }
  

}




    