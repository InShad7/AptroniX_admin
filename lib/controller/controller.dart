import 'dart:io';

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

TextEditingController searchController = TextEditingController();

List imgUrl = [];
List searchList = [];
List myProduct = [];

Stream getProducts() async* {
  final QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('products').get();
  final List<DocumentSnapshot> docs = querySnapshot.docs;
  yield docs;
}

Stream getImgs() async* {
  final QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('FeatureImage').get();
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

Future<void> updateStatus(data, selectedItem) async {
  FirebaseFirestore.instance
      .collection('orders')
      .doc(data['id'])
      .update({'status': selectedItem});
}

Stream getOrder() async* {
  final QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('orders').get();
  final List<DocumentSnapshot> docs = querySnapshot.docs;
  yield docs;
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
