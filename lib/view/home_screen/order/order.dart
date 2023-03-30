import 'package:aptronix/view/home_screen/order/order_details.dart';
import 'package:aptronix/view/home_screen/widgets/my_list_view_builder.dart';
import 'package:aptronix/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderList extends StatelessWidget {
  const OrderList({super.key});

  @override
  Widget build(BuildContext context) {
    return MyListBuilder(
      ht: 14,
      contents: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Text(
                  'Order id: 123456789',
                  style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(fontSize: mHeight! / 48),
                      fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: mHeight! / 9),
                child: Text(
                  'Delivered',
                  style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(fontSize: mHeight! / 58),
                      fontWeight: FontWeight.w400,
                      color: Colors.green),
                ),
              ),
            ],
          ),
        ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderDetails(),
          ),
        ),
      ),
    );
  }
}
