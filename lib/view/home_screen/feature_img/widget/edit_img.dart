import 'dart:developer';
import 'dart:io';
import 'package:aptronixadmin/controller/controller.dart';
import 'package:aptronixadmin/utils/color.dart';
import 'package:aptronixadmin/view/home_screen/home_screen.dart';
import 'package:aptronixadmin/view/home_screen/production/widget/add_curosel_img.dart';
import 'package:aptronixadmin/view/login_screen/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class EditFeatureImg extends StatelessWidget {
  const EditFeatureImg({super.key, this.product});
  final product;
  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < product[0]['images'].length; i++) {
      imgUrl.add(product[0]['images'][i]);
    }
    return SizedBox(
      height: mHeight,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            for (var i = 0; i < imgUrl.length; i++)
              AddImgCard2(img: imgUrl[i], product: product, index: i),
            AddImgCard()
          ],
        ),
      ),
    );
  }
}

class AddImgCard2 extends StatefulWidget {
  const AddImgCard2({super.key, this.img, this.product, this.index});
  final img;
  final product;
  final index;

  @override
  State<AddImgCard2> createState() => _AddImgCard2State();
}

class _AddImgCard2State extends State<AddImgCard2> {
  String? imagePath;

  late Stream productStream;

  @override
  void initState() {
    super.initState();
    productStream = getProducts();
  }

  @override
  Widget build(BuildContext context) {
    log(imagePath.toString());
    log(imgUrl.toString());
    return Container(
      margin: const EdgeInsets.all(16),
      height: 300,
      width: 380,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: grey),
        image: DecorationImage(
          image: imagePath == null
              ? NetworkImage(widget.img) as ImageProvider
              : FileImage(File(imagePath!)),
          fit: BoxFit.contain,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () async {
                  ImagePicker imagePicker = ImagePicker();
                  final pickedFile = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);

                  if (pickedFile != null) {
                    setState(() {
                      imagePath = pickedFile.path;
                    });

                    updateImage(File(pickedFile.path), widget.img);
                  }
                },
                icon: const Icon(
                  Icons.edit_outlined,
                  size: 30,
                ),
                color: grey1,
              ),
              IconButton(
                onPressed: () {
                  deleteAlert(
                      context, widget.img, widget.product, widget.index);

                  // deleteImage(widget.img, widget.product, widget.index);

                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => HomeScreen(),
                  //   ),
                  // );

                  // imgUrl.removeAt(widget.index);
                },
                icon: Icon(Icons.delete_outline),
              ),
            ],
          ),
        ],
      ),
    );
  }

  deleteAlert(context, img, product, index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
          'Are you sure want to delete!',
          style: GoogleFonts.ubuntu(fontSize: mHeight! / 50),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              // deleteProduct(product);
              deleteImage(img, product, index);

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );

              imgUrl.removeAt(widget.index);
              // Navigator.pop(context);

              setState(() {
                productStream = getProducts();
              });
              Fluttertoast.showToast(
                msg: "Deleted.",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: deleteRed,
                textColor: Colors.white,
                fontSize: 17.0,
              );
            },
            child: Text(
              'DELETE',
              style:
                  GoogleFonts.ubuntu(color: deleteRed, fontSize: mHeight! / 60),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'DISMISS',
              style: GoogleFonts.ubuntu(color: grey1, fontSize: mHeight! / 60),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> deleteImage(String imagePath, product, index) async {
    final docSnapshot = await FirebaseFirestore.instance
        .collection('FeatureImage')
        .doc('images')
        .get();

    final imageList = docSnapshot.data()?['images'] ?? [];
    imageList.removeAt(index);
    await FirebaseFirestore.instance
        .collection('FeatureImage')
        .doc('images')
        .update({'images': imageList});

    // setState(() {
    imgUrl = imageList;
    // });
  }
}
