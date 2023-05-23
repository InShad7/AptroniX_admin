import 'package:aptronixadmin/controller/controller.dart';
import 'package:aptronixadmin/utils/color.dart';
import 'package:aptronixadmin/view/home_screen/order/widget/order_tile.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatefulWidget {
  const OrderCard({super.key, this.search = false});
  final search;
  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  late Stream ordersStream;
  @override
  void initState() {
    ordersStream = getOrder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ordersStream,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: blue));
          }
          if (snapshot.connectionState == ConnectionState.done ||
              snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              final data = snapshot.data;
              return snapshot.data!.isEmpty
                  ? const Center(child: Text('List empty'))
                  : (widget.search ? searchList.length : myProduct.length) > 0
                      ? ListView.builder(
                          itemCount:
                              widget.search ? searchList.length : data.length,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            // List filteredList = [];
                            // for (int i = 0; i < data.length; i++) {
                            //   filteredList.add(myProduct
                            //       .where((item) =>
                            //           data[i]['products'].contains(item['id']))
                            //       .toList()
                            //     ..sort((a, b) => data
                            //         .indexOf(a['id'])
                            //         .compareTo(data.indexOf(b['id']))));
                            // }

                            final product =
                                widget.search ? searchList[index] : data[index];
                            return OrderTile(
                                product: product, data: data, index: index);
                          },
                        )
                      : Center(child: Image.asset('assets/nomatchfound.jpeg'));
            }
          }
          return const Text("Cant fetch Data");
        });
  }
}
