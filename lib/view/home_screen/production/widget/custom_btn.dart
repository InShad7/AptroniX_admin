import 'package:aptronixadmin/controller/controller.dart';
import 'package:aptronixadmin/model/model.dart';
import 'package:aptronixadmin/utils/color.dart';
import 'package:aptronixadmin/view/home_screen/feature_img/feature_img.dart';
import 'package:aptronixadmin/view/home_screen/home_screen.dart';
import 'package:aptronixadmin/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

Widget addBtn(
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
          validateAndAdd(context, navigateTo);
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

void validateAndAdd(context, Widget navigateTo) {
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
        duration:const Duration(seconds: 2),
      ),
    );
  } else {
    Product myProduct = Product(
        name: nameController.text.trim(),
        category: categoryController.text.trim(),
        color: colorController.text.trim(),
        description: descriptionController.text.trim(),
        price: priceController.text.trim(),
        quantity: int.parse(quantityController.text.trim()),
        size: int.parse(sizeController.text.trim()),
        images: imgUrl);
    myProduct.addToFirestore();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => navigateTo,
      ),
    );
    clear();
    Fluttertoast.showToast(
      msg: "Product added.",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 17.0,
    );
  }
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

Widget saveBtn(context) {
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
          validateAndSave(context);
        },
        child: Text(
          "Save Image",
          style: GoogleFonts.ubuntu(
            textStyle: TextStyle(fontSize: mHeight! / 36),
          ),
        ),
      ),
    ),
  );
}

void validateAndSave(context) {
  if (imgUrl.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Add images...',
          style: GoogleFonts.ubuntu(
            textStyle: TextStyle(fontSize: mHeight! / 50),
          ),
        ),
        backgroundColor: deleteRed,
        duration: const Duration(seconds: 2),
      ),
    );
  } else {
    FeatureImage myFeatureImg = FeatureImage(images: imgUrl);
    myFeatureImg.addFeatureImg();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
    imgUrl.clear();

    Fluttertoast.showToast(
      msg: "Image added.",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 17.0,
    );
  }
}
