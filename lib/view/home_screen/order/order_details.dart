import 'package:aptronix/view/home_screen/widget/my_appbar.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, title: 'Order Details'),
    );
  }
}
