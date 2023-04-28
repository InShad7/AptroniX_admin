import 'dart:io';
import 'package:aptronixadmin/controller/controller.dart';
import 'package:aptronixadmin/utils/color.dart';
import 'package:aptronixadmin/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddFeatureImg extends StatelessWidget {
  const AddFeatureImg({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: mHeight,
      child: SingleChildScrollView(
        // scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: const [
            AddImgCard(),
            AddImgCard(),
            AddImgCard(),
            AddImgCard(),
          ],
        ),
      ),
    );
  }
}

class AddImgCard extends StatefulWidget {
  const AddImgCard({super.key});

  @override
  State<AddImgCard> createState() => _AddImgCardState();
}

class _AddImgCardState extends State<AddImgCard> {
  String? imagePath;

  @override
  Widget build(BuildContext context) {
    // log(imagePath.toString());
    // log(imgUrl.toString());
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
              ? const AssetImage('assets/2929936.jpg') as ImageProvider
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

                uploadImage(File(pickedFile.path));
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
