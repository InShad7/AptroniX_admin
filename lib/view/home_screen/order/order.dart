import 'dart:developer';

import 'package:aptronixadmin/controller/controller.dart';
import 'package:aptronixadmin/utils/color.dart';
import 'package:aptronixadmin/utils/utils.dart';
import 'package:aptronixadmin/view/home_screen/order/order_details.dart';
import 'package:aptronixadmin/view/home_screen/order/widget/order_card.dart';
import 'package:aptronixadmin/view/home_screen/order/widget/order_tile.dart';
import 'package:aptronixadmin/view/home_screen/widgets/search_bar.dart';
import 'package:aptronixadmin/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderList extends StatefulWidget {
  const OrderList({super.key});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  bool search = false;
  bool a = false;
  void refresh() {
    setState(() {
      a = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          kHeight,
          SearchBar(order: true),
          kHeight20,
          Expanded(
            child: StreamBuilder(
                stream: getOrder(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: CircularProgressIndicator(color: blue));
                  }
                  if (snapshot.connectionState == ConnectionState.done ||
                      snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData) {
                      final data = snapshot.data;
                      datalist1 = data;
                      return snapshot.data!.isEmpty
                          ? const Center(child: Text('List empty'))
                          : ListView.builder(
                              itemCount: data.length,
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                List filteredList = [];
                                for (int i = 0; i < data.length; i++) {
                                  filteredList.add(myProduct
                                      .where((item) => data[i]['products']
                                          .contains(item['id']))
                                      .toList()
                                    ..sort((a, b) => data
                                        .indexOf(a['id'])
                                        .compareTo(data.indexOf(b['id']))));
                                }
                                orderP = filteredList;
                                final product = filteredList[index];
                                return OrderTile(
                                  product: product,
                                  data: data,
                                  index: index,
                                  refresh: refresh,
                                );
                              },
                            );
                    }
                  }
                  return const Text("Cant fetch Data");
                }),
          )
        ],
      ),
    );
  }
}
