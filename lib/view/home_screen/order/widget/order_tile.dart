import 'package:aptronixadmin/utils/utils.dart';
import 'package:aptronixadmin/view/home_screen/order/order_details.dart';
import 'package:aptronixadmin/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/color.dart';

class OrderTile extends StatelessWidget {
  const OrderTile(
      {super.key,
      this.data,
      this.index,
      this.product,
      this.search = false,
      this.refresh});
  final data;
  final index;
  final product;
  final search;
  final refresh;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: mWidth! / 20, right: mWidth! / 20, top: mHeight! / 130),
      child: Container(
        height: mHeight! / 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: cardClr,
        ),
        child: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: SizedBox(
                      width: 220,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product[0]['name'],
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(fontSize: mHeight! / 40),
                                fontWeight: FontWeight.w400),
                          ),
                          kHeight,
                          Text(
                            data[index]['username'],
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                    color: grey1, fontSize: mHeight! / 52),
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 80,
                    child: Text(
                      data[index]['status'],
                      style: GoogleFonts.ubuntu(
                          textStyle: TextStyle(fontSize: mHeight! / 58),
                          fontWeight: FontWeight.w400,
                          color: data[index]['status'] == 'Ordered'
                              ? black
                              : data[index]['status'] == 'Shipped'
                                  ? blue1
                                  : data[index]['status'] == 'Out Of Delivery'
                                      ? yellow
                                      : data[index]['status'] == 'Cancelled'
                                          ? red
                                          : Colors.green),
                    ),
                  ),
                  // kWidth,
                ],
              ),
            ),
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderDetailsScreen(
                      product: product[0], data: data[index]),
                ),
              );
              if (result == 'refresh') {
                refresh();
              }
            }),
      ),
    );
  }
}
