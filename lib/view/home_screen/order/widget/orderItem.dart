import 'package:aptronix/utils/color.dart';
import 'package:aptronix/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../login_screen/login_screen.dart';

Widget orderItems() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "       Products",
        style: GoogleFonts.sora(
          textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
      ListView.builder(
        itemCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(
              left: mWidth! / 22, right: mWidth! / 22, bottom: mHeight! / 90),
          child: Container(
            height: mHeight! / 9.6,
            width: mWidth,
            decoration: BoxDecoration(
              color: grey,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: mHeight! / 12,
                    width: mWidth! / 6.3,
                    decoration: BoxDecoration(
                      color: blue,
                      borderRadius: BorderRadius.circular(14),
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/71yzJoE7WlL._SX522_.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  kWidth,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      kHeight,
                      Text(
                        'iPhone 14 Pro',
                        style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(fontSize: mHeight! / 48),
                            fontWeight: FontWeight.w400),
                      ),
                      kHeight5,
                      Text(
                        '128 GB',
                        style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(fontSize: mHeight! / 67),
                            fontWeight: FontWeight.w400),
                      ),
                      kHeight,
                      Row(
                        children: [
                          Text(
                            '₹ 89,990',
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(fontSize: mHeight! / 50),
                                fontWeight: FontWeight.w500),
                          ),
                          kWidth150,
                          Text(
                            'QTY:1',
                            style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(fontSize: mHeight! / 50),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
