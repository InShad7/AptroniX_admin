import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String? id;
  String? name;
  String? category;
  int? quantity;
  int? size;
  String? color;
  String? price;
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
      this.images,
      this.id});

  Future<void> addToFirestore() async {
    try {
      final ref = FirebaseFirestore.instance.collection('products');

      final docRef = ref.doc();
      final id = docRef.id;
      Map<String, dynamic> toMap() {
        return {
          "id": id,
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

      await docRef.set(toMap());
    } catch (e) {
      print('Error adding product: $e');
    }
  }

  Future<void> updateDocument(product) async {
    final docRef =
        FirebaseFirestore.instance.collection('products').doc(product['id']);
    // log(docRef.toString());

    await docRef.update(dataToUpdate());
  }

  Map<String, dynamic> dataToUpdate() {
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
}

class FeatureImage {
  List? images;
  // String? id;

  FeatureImage({
    this.images,
    // this.id,
  });

  Future<void> addFeatureImg() async {
    try {
      final ref = FirebaseFirestore.instance.collection('FeatureImage');
      final docRef = ref.doc('images');
      // final id = docRef.id;

      Map<String, dynamic> saveImg() {
        return {'images': images};
      }

      await docRef.set(saveImg());
    } catch (e) {
      print('Error adding product: $e');
    }
  }
}
