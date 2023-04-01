import 'package:aptronixadmin/view/login_screen/login_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final imgUrl = [
  'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-14-pro-storage-select-202209-6-1inch-deeppurple?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1663790290205',
  'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-14-pro-finish-select-202209-6-1inch-deeppurple_AV1_GEO_EMEA?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1661969351334',
  'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-14-pro-model-unselect-gallery-2-202209_GEO_EMEA?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1660753617539',
  'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-14-pro-finish-select-202209-6-1inch-deeppurple_AV2?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1660754255928',
];

CarouselSlider customCurosel() {
  return CarouselSlider.builder(
    itemCount: imgUrl.length,
    itemBuilder: (context, index, realIndex) {
      final urlImg = imgUrl[index];
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
      color: Colors.grey,
      child: Image.network(
        imgUrl,
        fit: BoxFit.cover,
      ),
    );
