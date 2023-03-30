import 'package:aptronix/utils/color.dart';
import 'package:aptronix/view/home_screen/widget/my_appbar.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, title: 'Product Details'),
      body: Container(
        color: blue,
      ),
    );
  }
}
