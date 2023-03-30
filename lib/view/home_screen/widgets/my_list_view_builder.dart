import 'package:aptronix/utils/color.dart';
import 'package:aptronix/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

class MyListBuilder extends StatelessWidget {
  var contents;
  num ht;
  

  MyListBuilder(
      {super.key,
      required this.contents,
      required this.ht,
      });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(
            left: mWidth! / 20, right: mWidth! / 20, top: mHeight! / 130),
        child: Container(
          height: mHeight! / ht,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: grey,
          ),
          child: contents,
        ),
      ),
    );
  }
}
