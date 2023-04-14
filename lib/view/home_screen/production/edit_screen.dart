import 'package:aptronixadmin/controller/controller.dart';
import 'package:aptronixadmin/utils/utils.dart';
import 'package:aptronixadmin/view/home_screen/home_screen.dart';
import 'package:aptronixadmin/view/home_screen/production/widget/custom_btn.dart';
import 'package:aptronixadmin/view/home_screen/production/widget/custom_field.dart';
import 'package:aptronixadmin/view/home_screen/production/widget/edit_curosel.dart';
import 'package:aptronixadmin/view/home_screen/widgets/my_appbar.dart';
import 'package:aptronixadmin/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key, required this.product});
  final product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, title: 'Edit Product'),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          EditCuroselImg(product: product),
          kHeight,
          customField2(
              controller: nameController =
                  TextEditingController(text: product['name']),
              label: 'Product Name',
              width: mWidth!,
              height: mHeight! / 15,
              max: false,
              num: false,
              readOnly: false),
          Row(
            children: [
              customField2(
                  controller: categoryController =
                      TextEditingController(text: product['category']),
                  label: 'Category',
                  width: mWidth! / 2,
                  height: mHeight! / 14,
                  max: false,
                  num: false,
                  readOnly: false),
              customField2(
                  controller: quantityController = TextEditingController(
                      text: product['quantity'].toString()),
                  label: 'Quantity',
                  width: mWidth! / 3.3,
                  height: mHeight! / 14,
                  max: false,
                  num: true,
                  readOnly: false),
            ],
          ),
          Row(
            children: [
              customField2(
                  controller: sizeController =
                      TextEditingController(text: product['size'].toString()),
                  label: 'Size',
                  width: mWidth! / 3,
                  height: mHeight! / 14,
                  max: false,
                  num: true,
                  readOnly: false),
              customField2(
                  controller: colorController =
                      TextEditingController(text: product['color']),
                  label: 'Color',
                  width: mWidth! / 2.1,
                  height: mHeight! / 14,
                  max: false,
                  num: false,
                  readOnly: false),
            ],
          ),
          customField2(
              controller: priceController =
                  TextEditingController(text: product['price'].toString()),
              label: 'Price',
              width: mWidth!,
              height: mHeight! / 14,
              max: false,
              num: true,
              readOnly: false),
          customField2(
              controller: descriptionController =
                  TextEditingController(text: product['description']),
              label: "Description",
              width: mWidth!,
              height: mHeight! / 5.5,
              max: true,
              num: false,
              readOnly: false),
          // kHeight100,
        ],
      ),
      bottomNavigationBar: addBtn(
          navigateTo: HomeScreen(),
          context: context,
          title: 'Update',
          add: false,
         product: product
          ),
    );
  }
}
