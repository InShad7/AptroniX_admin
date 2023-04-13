import 'dart:developer';
import 'dart:io';
import 'package:aptronixadmin/controller/controller.dart';
import 'package:aptronixadmin/utils/color.dart';
import 'package:aptronixadmin/view/home_screen/production/widget/add_curosel_img.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditCuroselImg extends StatelessWidget {
  const EditCuroselImg({super.key, this.product});
  final product;
  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < product['images'].length; i++) {
      imgUrl.add(product['images'][i]);
    }

    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: [
            for (var image in product['images']) AddImgCard2(img: image),
            AddImgCard()
          ],
        ),
      ),
    );
  }
}

class AddImgCard2 extends StatefulWidget {
  const AddImgCard2({super.key, this.img});
  final img;

  @override
  State<AddImgCard2> createState() => _AddImgCard2State();
}

class _AddImgCard2State extends State<AddImgCard2> {
  String? imagePath;

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
          IconButton(
            onPressed: () async {
              ImagePicker imagePicker = ImagePicker();
              final pickedFile =
                  await ImagePicker().pickImage(source: ImageSource.gallery);

              if (pickedFile != null) {
                setState(() {
                  imagePath = pickedFile.path;
                });

                updateImage(File(pickedFile.path), widget.img);
                // imgUrl.clear();
              }
            },
            icon: const Icon(
              Icons.edit_outlined,
              size: 30,
            ),
            color: grey1,
          ),
        ],
      ),
    );
  }
}
