import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DialogWidget extends StatelessWidget {
  final String? message;
  DialogWidget({this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      content: Text(
          "No Order Found",
        textAlign: TextAlign.center,
        style:  GoogleFonts.montserrat(fontSize: 17),
      ),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).cardTheme.color,
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            elevation: 2,
          ),

          onPressed: (){
            Navigator.pop(context);
          },

          child:  Center(
            child: Text(
              "Ok",
              style: GoogleFonts.montserrat(fontSize: 15),
            ),
          ),
        )
      ],
    );
  }
}
