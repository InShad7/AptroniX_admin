import 'package:aptronixadmin/controller/controller.dart';
import 'package:aptronixadmin/utils/utils.dart';
import 'package:aptronixadmin/view/home_screen/home_screen.dart';
import 'package:aptronixadmin/view/home_screen/production/widget/add_curosel_img.dart';
import 'package:aptronixadmin/view/home_screen/production/widget/custom_btn.dart';
import 'package:aptronixadmin/view/home_screen/production/widget/custom_field.dart';
import 'package:aptronixadmin/view/home_screen/production/widget/dropdown_btn.dart';
import 'package:aptronixadmin/view/home_screen/widgets/my_appbar.dart';
import 'package:aptronixadmin/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 251, 251, 251),
      appBar: MyAppBar(context, title: 'Add Product'),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          SetCuroselImg(),
          kHeight,
          customField2(
              controller: nameController,
              label: 'Product Name',
              width: mWidth!,
              max: false,
              num: false,
              height: mHeight! / 16,
              readOnly: false),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              dropDownList(
                label: "Category",
                height: mHeight! / 15,
                width: mWidth! / 2,
                GB: true,
                edit: false,
              ),
              customField2(
                  controller: quantityController,
                  label: 'Quantity',
                  width: mWidth! / 2.9,
                  height: mHeight! / 16,
                  max: false,
                  num: true,
                  readOnly: false),
            ],
          ),
          Row(
            children: [
              dropDownList(
                label: "Size",
                height: mHeight! / 15,
                width: mWidth! / 3,
                GB: false,
                edit: false,
              ),
              customField2(
                  controller: colorController,
                  label: 'Color',
                  width: mWidth! / 1.99,
                  height: mHeight! / 16,
                  max: false,
                  num: false,
                  readOnly: false),
            ],
          ),
          customField2(
              controller: priceController,
              label: 'Price',
              width: mWidth!,
              height: mHeight! / 16,
              max: false,
              num: true,
              readOnly: false),
          customField2(
              controller: descriptionController,
              label: "Description",
              max: true,
              num: false,
              readOnly: false),
          // kHeight100,
        ],
      ),
      bottomNavigationBar: addBtn(
        navigateTo: HomeScreen(),
        context: context,
        title: 'Save',
      ),
    );
  }
}
