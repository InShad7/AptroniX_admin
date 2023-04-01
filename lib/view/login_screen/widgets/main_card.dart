import 'package:aptronixadmin/utils/color.dart';
import 'package:aptronixadmin/utils/utils.dart';
import 'package:aptronixadmin/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInText extends StatelessWidget {
  const SignInText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: mHeight! / 6),
      child: Column(
        children: [
          Text(
            'Aptronix',
            style: GoogleFonts.ubuntu(
              textStyle: TextStyle(fontSize: mHeight! / 26, color: black),
            ),
          ),
          kHeight,
          Text(
            'Sign In',
            style: GoogleFonts.ubuntu(
              textStyle: TextStyle(
                fontSize: mHeight! / 16,
                color: black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          kHeight20,
        ],
      ),
    );
  }
}
