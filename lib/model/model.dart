import 'dart:io';

import 'package:aptronixadmin/controller/controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Product {
  String? name;
  String? category;
  int? quantity;
  int? size;
  String? color;
  double? price;
  String? description;
  List? images;

  Product(
      {this.name,
      this.category,
      this.quantity,
      this.price,
      this.size,
      this.color,
      this.description,
      this.images});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'category': category,
      'quantity': quantity,
      'size': size,
      'color': color,
      'price': price,
      'description': description,
      'images': images
    };
  }

  Future<void> addToFirestore() async {
    try {
      await FirebaseFirestore.instance
          .collection('products')
          .doc(nameController.text)
          .set(toMap());
    } catch (e) {
      print('Error adding product: $e');
    }
  }
}
