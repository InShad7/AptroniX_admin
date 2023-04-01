import 'package:aptronixadmin/utils/color.dart';
import 'package:aptronixadmin/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

AppBar MyAppBar(BuildContext context, {required String title}) {
  return AppBar(
    backgroundColor: white,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: black),
    leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.arrow_back_ios_new)),
    title: Text(
      title,
      style: GoogleFonts.ubuntu(
        textStyle: TextStyle(
            fontSize: mHeight! / 25, color: black, fontWeight: FontWeight.w400),
      ),
    ),
  );
}
