import 'package:aptronixadmin/controller/controller.dart';
import 'package:aptronixadmin/utils/utils.dart';
import 'package:aptronixadmin/view/home_screen/production/edit_screen.dart';
import 'package:aptronixadmin/view/home_screen/production/widget/curosel.dart';
import 'package:aptronixadmin/view/home_screen/production/widget/custom_btn.dart';
import 'package:aptronixadmin/view/home_screen/production/widget/text_field.dart';
import 'package:aptronixadmin/view/home_screen/widgets/my_appbar.dart';
import 'package:aptronixadmin/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});
  final product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, title: 'Product Details'),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          customCurosel(product),
          kHeight,
          detailsField(
              label: 'Product Name',
              content: product['name'],
              max: 3,
              num: false,
              readOnly: true),
          Row(
            children: [
              detailsField(
                  label: 'Category',
                  content: product['category'],
                  width: mWidth! / 2,
                  ht: mHeight! / 14,
                  max: 1,
                  num: false,
                  readOnly: true),
              detailsField(
                  label: 'Quantity',
                  content: product['quantity'].toString(),
                  width: mWidth! / 3.3,
                  ht: mHeight! / 14,
                  max: 1,
                  num: true,
                  readOnly: true),
            ],
          ),
          Row(
            children: [
              detailsField(
                  label: 'Size',
                  content: product['size'].toString(),
                  width: mWidth! / 3,
                  ht: mHeight! / 14,
                  max: 1,
                  num: true,
                  readOnly: true),
              detailsField(
                label: 'Color',
                content: product['color'],
                width: mWidth! / 2.1,
                ht: mHeight! / 14,
                max: 1,
                num: false,
                readOnly: true,
              ),
            ],
          ),
          detailsField(
              label: 'Price',
              content: "₹ ${product['price'].toString()}",
              width: mWidth!,
              ht: mHeight! / 14,
              max: 1,
              num: true,
              readOnly: true),
          detailsField(
            label: "About this product",
            content: product['description'],
            max: 15,
            readOnly: true,
            num: false,
          ),
          // kHeight100,
        ],
      ),
      bottomNavigationBar: navigateBtn(
          context: context,
          title: 'Edit',
          navigateTo: EditScreen(product: product)),
    );
  }
}
