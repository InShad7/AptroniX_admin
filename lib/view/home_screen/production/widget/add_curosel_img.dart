import 'package:aptronix/utils/color.dart';
import 'package:aptronix/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

Widget setCuroselImg() {
    return SizedBox(
          height: mHeight! / 3,
          child: ListView.builder(
            shrinkWrap: true,
            physics:const ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) => Container(
              margin:const EdgeInsets.all(16),
              height: mHeight! / 3,
              width: mWidth! / 1.1,
              decoration: BoxDecoration(
                color: grey,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(
                Icons.add_circle_outline_rounded,
                color: grey1,
                size: mHeight! / 20,
              ),
            ),
          ),
        );
  }