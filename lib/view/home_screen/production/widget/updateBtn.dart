import 'package:aptronixadmin/controller/controller.dart';
import 'package:aptronixadmin/model/model.dart';
import 'package:aptronixadmin/utils/color.dart';
import 'package:aptronixadmin/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

Widget updateBtn(
    {context, required Widget navigateTo, required String title, product}) {
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
          validateAndUpdate(context, navigateTo, product);
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

void validateAndUpdate(context, Widget navigateTo, product) {
  if (nameController.text.isEmpty ||
      categoryController.text.isEmpty ||
      quantityController.text.isEmpty ||
      sizeController.text.isEmpty ||
      colorController.text.isEmpty ||
      priceController.text.isEmpty ||
      descriptionController.text.isEmpty ||
      imgUrl.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Enter valid data...',
          style: GoogleFonts.ubuntu(
            textStyle: TextStyle(fontSize: mHeight! / 50),
          ),
        ),
        backgroundColor: deleteRed,
        duration: const Duration(seconds: 2),
      ),
    );
  } else {
    Product updateProduct = Product(
        name: nameController.text,
        category: categoryController.text,
        color: colorController.text,
        description: descriptionController.text,
        price: double.parse(priceController.text),
        quantity: int.parse(quantityController.text),
        size: int.parse(sizeController.text),
        images: imgUrl);
    updateProduct.updateDocument(product);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => navigateTo,
      ),
    );
    clear();
    Fluttertoast.showToast(
      msg: "Product updated.",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 17.0,
    );
  }
}
