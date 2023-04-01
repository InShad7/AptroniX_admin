import 'package:aptronixadmin/utils/color.dart';
import 'package:aptronixadmin/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

class MyListBuilder extends StatelessWidget {
  var contents;
  num ht;
  bool shrinkwrap;
  var physics;

  MyListBuilder(
      {super.key,
      required this.contents,
      required this.ht,
      required this.shrinkwrap,
      required this.physics});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: shrinkwrap,
      physics: physics,
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
