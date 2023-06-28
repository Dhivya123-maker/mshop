import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget cancelButton = TextButton(
      child: Text(
        "Cancel",
        style: GoogleFonts.montserrat(fontSize: 15)
      ),
      onPressed:  () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text(
          "Continue",
          style: GoogleFonts.montserrat(fontSize: 15)
      ),
      onPressed:  () {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      },
    );

    return  AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      content: Text(
        "Do you want to logout",
        textAlign: TextAlign.center,
        style:  GoogleFonts.montserrat(fontSize: 17),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

  }
}
