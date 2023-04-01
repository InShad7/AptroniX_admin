import 'package:aptronixadmin/utils/color.dart';
import 'package:aptronixadmin/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var formKey = GlobalKey<FormState>();

TextEditingController userNameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class MyTextField extends StatelessWidget {
  String title;
  var myControler;
  IconData? icon;

  bool passChar;

  num ht;
  double border;

  MyTextField({
    super.key,
    required this.title,
    required this.icon,
    required this.myControler,
    required this.passChar,
    required this.ht,
    required this.border
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: mWidth! / 35),
          height: mHeight! / ht,
          width: mWidth! / 1.099,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(border),
            color: grey,
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: TextFormField(
              obscureText: passChar,
              controller: myControler,
              cursorColor: blue,
              style: TextStyle(color: black),
              decoration: InputDecoration(
                prefixIcon: Icon(icon, size: mHeight! / 35, color: blue),
                border: const OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: const EdgeInsets.all(5),
                hintText: title,
                hintStyle: GoogleFonts.ubuntu(
                  textStyle: TextStyle(fontSize: mHeight! / 44),
                ),
              ),
              // validator: (value) {
              //   if (value == null || value.isEmpty || value.trim() == '') {
              //     return 'Please Enter Credential';
              //   }
              //   return null;
              // },
            ),
          ),
        ),
      ],
    );
  }
}
