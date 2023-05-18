import 'package:aptronixadmin/utils/color.dart';
import 'package:aptronixadmin/view/login_screen/login_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

CarouselSlider customCurosel(product) {
  return CarouselSlider.builder(
    itemCount: product['images'].length,
    itemBuilder: (context, index, realIndex) {
      final urlImg = product['images'][index];
      return buildImage(urlImg, index);
    },
    options: CarouselOptions(
      height: mHeight! / 2.5,
      autoPlay: true,
      // viewportFraction: 1,
      enlargeCenterPage: true,
    ),
  );
}

Widget buildImage(String imgUrl, int index) => Container(
      margin: EdgeInsets.symmetric(horizontal: mWidth! / 60),
      color: cardClr,
      child: Image.network(
        imgUrl,
        fit: BoxFit.cover,
      ),
    );
