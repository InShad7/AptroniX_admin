import 'package:aptronixadmin/utils/color.dart';
import 'package:aptronixadmin/utils/utils.dart';
import 'package:aptronixadmin/view/home_screen/order/widget/drop_down_list.dart';
import 'package:aptronixadmin/view/home_screen/order/widget/orderItem.dart';
import 'package:aptronixadmin/view/home_screen/production/widget/text_field.dart';
import 'package:aptronixadmin/view/home_screen/widgets/my_appbar.dart';
import 'package:aptronixadmin/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String? selectedItem;

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, title: 'Order Details'),
      body: ListView(children: [
        detailsField(
          label: 'Username',
          ht: mHeight! / 14,
          width: mWidth!,
          num: false,
          max: 1,
          content: 'admin',
          readOnly: true,
        ),
        detailsField(
          label: 'Address',
          ht: mHeight! / 6,
          width: mWidth!,
          num: false,
          max: 10,
          content:
              'Address 1\n house no: Area\n Street Post\n City , State\n Pincode',
          readOnly: true,
        ),
        kHeight,
        orderItems(),
        detailsField(
          label: 'Payment',
          ht: mHeight! / 14,
          width: mWidth!,
          num: false,
          max: 2,
          content: 'Prepaid - UPI',
          readOnly: true,
        ),
      ]),
      bottomNavigationBar: Container(
        height: mHeight! / 10,
        width: mWidth,
        decoration: BoxDecoration(
          color: blue,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
          ),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text(
            'Order Status :',
            style: GoogleFonts.sora(
              textStyle: TextStyle(fontSize: 22, color: white),
            ),
          ),
          const DropDownList(),
        ]),
      ),
    );
  }
}
