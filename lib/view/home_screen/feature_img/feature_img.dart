import 'package:aptronixadmin/controller/controller.dart';
import 'package:aptronixadmin/utils/color.dart';
import 'package:aptronixadmin/view/home_screen/feature_img/widget/add_img.dart';
import 'package:aptronixadmin/view/home_screen/feature_img/widget/edit_img.dart';
import 'package:aptronixadmin/view/home_screen/production/widget/custom_btn.dart';
import 'package:flutter/material.dart';

class FeatureImg extends StatelessWidget {
  FeatureImg({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: getImgs(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(color: blue),
                );
              }
              if (snapshot.connectionState == ConnectionState.done ||
                  snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  final data = snapshot.data;
                  return snapshot.data!.isEmpty
                      ? AddFeatureImg()
                      : EditFeatureImg(product: data);
                }
              }
              return Text('Cant fetch data');
            }),
        bottomNavigationBar: saveBtn(context));
  }
}
