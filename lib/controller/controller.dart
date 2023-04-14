import 'dart:developer';
import 'dart:io';

import 'package:aptronixadmin/model/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

TextEditingController nameController = TextEditingController();
TextEditingController categoryController = TextEditingController();
TextEditingController quantityController = TextEditingController();
TextEditingController sizeController = TextEditingController();
TextEditingController colorController = TextEditingController();
TextEditingController priceController = TextEditingController();
TextEditingController descriptionController = TextEditingController();
TextEditingController idController = TextEditingController();

List imgUrl = [];

Stream getProducts() async* {
  final QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('products').get();
  final List<DocumentSnapshot> docs = querySnapshot.docs;
  yield docs;
}

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

// Delete a document
Future<void> deleteProduct(String productId) {
  final CollectionReference productsRef =
      FirebaseFirestore.instance.collection('products');
  return productsRef.doc(productId).delete();
}

Future<void> updateDocument(product) async {
  final docRef =
      FirebaseFirestore.instance.collection('products').doc(product['id']);
  log(docRef.toString());

  await docRef.update(dataToUpdate);
}

Map<String, dynamic> dataToUpdate = {
  'name': nameController.text,
  "category": categoryController.text,
  'color': colorController.text,
  'description': descriptionController.text,
  'price': priceController.text,
  'quantity': quantityController.text,
  'size': sizeController.text,
  'images': imgUrl
};
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
