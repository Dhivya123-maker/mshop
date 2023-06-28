import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mshop/const/utils.dart';
import 'package:mshop/widgets/dialog_widget.dart';
import 'package:mshop/widgets/logout_widget.dart';

class AccountFragment extends StatelessWidget {
  const AccountFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return  Scaffold(
      backgroundColor: Theme.of(context).backgroundColor.withOpacity(.99),
      body: SingleChildScrollView(
        child : Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(12.0),
                    child:GestureDetector(
                      onTap: (){
                        showDialog(
                            context: context,
                            builder: (ctx) =>
                          DialogWidget(),
                        );
                      },
                      child: Container(
                        width: size.height,
                        height: size.height*0.20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Image.asset(
                                  'assets/images/order.png',
                                  width: size.height*0.10,
                                  height: size.height*0.10,
                                  fit:BoxFit.fill

                            ),
                            SizedBox(height: 10,),
                            Text(
                              "Orders",
                              textAlign: TextAlign.justify,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.montserrat(fontSize: 15),
                            ),

                          ],


              ),
                  ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Container(
                width: size.height,
                height: size.height*0.20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Image.asset(
                          'assets/images/location.png',
                          width: size.height*0.10,
                          height: size.height*0.10,
                          fit:BoxFit.fill

                    ),
                    SizedBox(height: 10,),
                    Text(
                      "Address",
                      textAlign: TextAlign.justify,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.montserrat(fontSize: 15),
                    ),

                  ],
                ),

              ),


            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: GestureDetector(
                onTap: (){
                  showDialog(
                    context: context,
                    builder: (ctx) =>
                       const LogoutWidget(),
                  );
                },
                child: Container(
                  width: size.height,
                  height: size.height*0.20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                            'assets/images/logout.png',
                            width: size.height*0.10,
                            height: size.height*0.10,
                            fit:BoxFit.fill
                        ),
                      SizedBox(height: 10,),
                      Text(
                        "Logout",
                        textAlign: TextAlign.justify,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.montserrat(fontSize: 15),
                      ),

                    ],
                  ),

                ),
              ),


            ),
          ],
        )


      ),
    );
  }
}

