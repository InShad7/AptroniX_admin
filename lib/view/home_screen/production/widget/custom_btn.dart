import 'package:aptronix/utils/color.dart';
import 'package:aptronix/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customBtn({context, required Widget navigateTo, required String title}) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SizedBox(
      height: mHeight! / 15,
      width: mWidth,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => navigateTo,
            ),
          );
        },
        child: Text(
          title,
          style: GoogleFonts.ubuntu(
            textStyle: TextStyle(fontSize: mHeight! / 30),
          ),
        ),
      ),
    ),
  );
}
