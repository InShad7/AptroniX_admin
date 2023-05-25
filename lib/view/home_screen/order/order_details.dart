import 'package:aptronixadmin/utils/color.dart';
import 'package:aptronixadmin/utils/utils.dart';
import 'package:aptronixadmin/view/home_screen/order/widget/drop_down_list.dart';
import 'package:aptronixadmin/view/home_screen/order/widget/field.dart';
import 'package:aptronixadmin/view/home_screen/order/widget/orderItem.dart';
import 'package:aptronixadmin/view/home_screen/order/widget/status_page.dart';
import 'package:aptronixadmin/view/home_screen/widgets/my_appbar.dart';
import 'package:aptronixadmin/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key, this.product, this.index, this.data});
  final product;
  final index;
  final data;
  @override
  Widget build(BuildContext context) {
    Future<bool> onWillPop() async {
      Navigator.pop(context, 'refresh');
      return true;
    }

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: MyAppBar(context, title: 'Order details'),
        body: ListView(children: [
          kHeight20,

          CartCard(
            quantity: false,
            product: product,
            index: index,
            data: data,
          ),
          kHeight,
          CustomTextField(
            label: 'Order Id',
            ht: 65,
            width: mWidth!,
            num: false,
            max: 1,
            content: data['id'],
            readOnly: true,
          ),

          kHeight,
          CustomTextField(
            label: 'User Email',
            ht: 65,
            width: mWidth!,
            num: false,
            max: 1,
            content: data['username'],
            readOnly: true,
          ),
          kHeight,
          CustomTextField(
            label: 'Address',
            ht: 200,
            width: mWidth!,
            num: false,
            max: 10,
            content:
                "${data['address']['name']}\n${data['address']['houseNumber']}\n${data['address']['streetName']}\n${data['address']['city']}\n${data['address']['state']}\n${data['address']['pincode']}\n${data['address']['phoneNumber']}\n",
            readOnly: true,
          ),
          kHeight,
          CustomTextField(
            label: 'Total Amount',
            ht: 65,
            width: mWidth!,
            num: false,
            max: 1,
            content:
                '${int.parse(product['price']) * data['count']}  -  ${data['payment']}',
            readOnly: true,
          ),

          kHeight,
          // StatusPage(),
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
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Text(
              'Order Status :',
              style: GoogleFonts.sora(
                textStyle: TextStyle(fontSize: 22, color: white),
              ),
            ),
            DropDownList(data: data),
          ]),
        ),
      ),
    );
  }
}
