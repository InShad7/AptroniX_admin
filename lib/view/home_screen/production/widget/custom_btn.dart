import 'dart:developer';

import 'package:aptronixadmin/controller/controller.dart';
import 'package:aptronixadmin/model/model.dart';
import 'package:aptronixadmin/utils/color.dart';
import 'package:aptronixadmin/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget addBtn({context, required Widget navigateTo, required String title}) {
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
          
          Product myProduct = Product(
              name: nameController.text,
              category: categoryController.text,
              color: colorController.text,
              description: descriptionController.text,
              price: double.parse(priceController.text),
              quantity: int.parse(quantityController.text),
              size: int.parse(sizeController.text),
              images: imgUrl);

          myProduct.addToFirestore();
          // Navigator.pop(context);
          log(imgUrl.toString());

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => navigateTo,
            ),
          );
          clear();
        },
        child: Text(
          title,
          style: GoogleFonts.ubuntu(
            textStyle: TextStyle(fontSize: mHeight! / 36),
          ),
        ),
      ),
    ),
  );
}

Widget navigateBtn(
    {context, required String title, required Widget navigateTo}) {
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
            textStyle: TextStyle(fontSize: mHeight! / 36),
          ),
        ),
      ),
    ),
  );
}
