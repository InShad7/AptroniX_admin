import 'package:aptronix/utils/color.dart';
import 'package:aptronix/utils/utils.dart';
import 'package:aptronix/view/home_screen/home_screen.dart';
import 'package:aptronix/view/home_screen/production/widget/add_curosel_img.dart';
import 'package:aptronix/view/home_screen/production/widget/custom_btn.dart';
import 'package:aptronix/view/home_screen/production/widget/details_field.dart';
import 'package:aptronix/view/home_screen/widgets/my_appbar.dart';
import 'package:aptronix/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, title: 'Add Product'),
      body: ListView(
        children: [
          setCuroselImg(),
          kHeight,
          detailsField(
              label: 'Product Name',
              content: 'iPhone 14 Pro',
              width: mWidth!,
              ht: mHeight! / 14,
              max: 1,
              num: false,
              readOnly: false),
          Row(
            children: [
              detailsField(
                  label: 'Category',
                  content: 'iPhone',
                  width: mWidth! / 2,
                  ht: mHeight! / 14,
                  max: 1,
                  num: false,
                  readOnly: false),
              detailsField(
                  label: 'Quantity',
                  content: '5',
                  width: mWidth! / 3.3,
                  ht: mHeight! / 14,
                  max: 1,
                  num: true,
                  readOnly: false),
            ],
          ),
          Row(
            children: [
              detailsField(
                  label: 'Size',
                  content: '256',
                  width: mWidth! / 3,
                  ht: mHeight! / 14,
                  max: 1,
                  num: true,
                  readOnly: false),
              detailsField(
                  label: 'Color',
                  content: 'Deep Purple',
                  width: mWidth! / 2.1,
                  ht: mHeight! / 14,
                  max: 1,
                  num: false,
                  readOnly: false),
            ],
          ),
          detailsField(
              label: 'Price',
              content: '1,19,990',
              width: mWidth!,
              ht: mHeight! / 14,
              max: 1,
              num: true,
              readOnly: false),
          detailsField(
              label: "Description",
              content:
                  '128 GB ROM\n15.49cm (6.1inch)Super Retina XDR display\n48MP + 12MP + 12MP|12MP Front Camera\nA16 Bionic Chip 6 Core Processor',
              width: mWidth!,
              ht: mHeight! / 5.5,
              max: 10,
              num: false,
              readOnly: false),
          // kHeight100,
        ],
      ),
      bottomNavigationBar:
          customBtn(navigateTo: HomeScreen(), context: context, title: 'Save'),
    );
  }
}
