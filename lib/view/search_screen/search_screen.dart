import 'dart:developer';

import 'package:aptronixadmin/controller/controller.dart';
import 'package:aptronixadmin/utils/color.dart';
import 'package:aptronixadmin/view/home_screen/order/order.dart';
import 'package:aptronixadmin/view/home_screen/order/widget/order_card.dart';
import 'package:aptronixadmin/view/home_screen/production/product_list.dart';
import 'package:aptronixadmin/view/search_screen/widget/product_card.dart';
import 'package:flutter/material.dart';

import '../home_screen/order/widget/order_tile.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
  });
  // final search;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool search = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                autofocus: true,
                controller: searchController,
                cursorColor: blue,
                style: TextStyle(color: blue),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: blue),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear, color: blue),
                    onPressed: () {
                      setState(() {
                        searchController.clear();
                        searchList = orderP;
                        log('controller2 ${searchController.text}');
                      });
                    },
                  ),
                  filled: true,
                  fillColor: const Color.fromRGBO(234, 236, 238, 2),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(50)),
                  hintText: 'Search . . .',
                ),
                onChanged: (value) {
                  search = true;
                  log(value);
                  setState(() {
                    searchList1 = orderP
                        .where((element) => element[0]['name']
                            .toLowerCase()
                            .replaceAll(RegExp(r"\s+"), "")
                            .replaceAll(RegExp(r"[()]"), "")
                            .contains(value
                                .toLowerCase()
                                .replaceAll(RegExp(r"\s+"), "")))
                        .toList();
                  });

                  log(searchList1.length.toString());
                },
              ),
            ),
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
                        return snapshot.data!.isEmpty
                            ? const Center(child: Text('List empty'))
                            : (search ? searchList1.length : orderP.length) > 0
                                ? ListView.builder(
                                    itemCount: (search
                                        ? searchList1.length
                                        : orderP.length),
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      List filteredList = [];
                                      List datalist = [];
                                      if (!search) {
                                        for (int i = 0; i < data.length; i++) {
                                          filteredList.add(myProduct
                                              .where((item) => data[i]
                                                      ['products']
                                                  .contains(item['id']))
                                              .toList()
                                            ..sort((a, b) => data
                                                .indexOf(a['id'])
                                                .compareTo(
                                                    data.indexOf(b['id']))));
                                        }
                                      } else {
                                        for (int i = 0;
                                            i < searchList1.length;
                                            i++) {
                                          filteredList.add(myProduct
                                              .where((item) => searchList1[i][0]
                                                      ['id']
                                                  .contains(item['id']))
                                              .toList()
                                            ..sort((a, b) => searchList1
                                                .indexOf(a['id'])
                                                .compareTo(searchList1
                                                    .indexOf(b['id']))));
                                          datalist = datalist1
                                              .where((item) => searchList1[i][0]
                                                      ['id']
                                                  .contains(item['products']))
                                              .toList()
                                            ..sort((a, b) => searchList1
                                                .indexOf(a['id'])
                                                .compareTo(searchList1
                                                    .indexOf(b['id'])));
                                        }
                                      }
                                      final datalist2 = datalist1;

                                      final product = filteredList[index];
                                      return OrderTile(
                                        product: product,
                                        data: datalist2,
                                        index: index,
                                        search: true,
                                      );
                                    },
                                  )
                                : Center(
                                    child: Image.asset(
                                        'assets/nomatchfound.jpeg'));
                      }
                    }
                    return const Text("Cant fetch Data");
                  }),
            )
          ],
        ),
      ),
    );
  }
}
