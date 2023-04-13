import 'dart:io';

import 'package:aptronixadmin/model/model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

TextEditingController nameController = TextEditingController();
TextEditingController categoryController = TextEditingController();
TextEditingController quantityController = TextEditingController();
TextEditingController sizeController = TextEditingController();
TextEditingController colorController = TextEditingController();
TextEditingController priceController = TextEditingController();
TextEditingController descriptionController = TextEditingController();

List<String> imgUrl = [];

Future<String> uploadImage(File imageFile) async {
  final uniqueImgName = DateTime.now();
  final refRoot = FirebaseStorage.instance.ref();
  final storageRef = refRoot.child('images');

  final imgToUpload = storageRef.child(uniqueImgName.toString());

  await imgToUpload.putFile(imageFile);
  final downloadURL = await imgToUpload.getDownloadURL();
  print('Image uploaded at $downloadURL');
  imgUrl.add(downloadURL);
  return downloadURL;
}



Future<String> updateImage(File imageFile, img) async {
  final uniqueImgName = DateTime.now();


  Reference imgToUpload = FirebaseStorage.instance.refFromURL(img);

  await imgToUpload.putFile(imageFile);
  final downloadURL = await imgToUpload.getDownloadURL();
  print('Image uploaded at $downloadURL');
  // imgUrl.add(downloadURL);
  return downloadURL;
}

clear() {
  nameController.clear();
  categoryController.clear();
  quantityController.clear();
  sizeController.clear();
  colorController.clear();
  priceController.clear();
  descriptionController.clear();
  imgUrl.clear();
}
