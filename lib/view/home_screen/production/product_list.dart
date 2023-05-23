import 'dart:developer';

import 'package:aptronixadmin/controller/controller.dart';
import 'package:aptronixadmin/utils/color.dart';
import 'package:aptronixadmin/utils/utils.dart';
import 'package:aptronixadmin/view/home_screen/production/add_screen.dart';
import 'package:aptronixadmin/view/home_screen/production/widget/custom_btn.dart';
import 'package:aptronixadmin/view/home_screen/production/widget/product_tile.dart';
import 'package:aptronixadmin/view/search_screen/widget/product_card.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  Future<void> _refresh() async {
    await  Future.delayed(const Duration(seconds: 1));
    setState(() {
      getProducts().listen((data) {
        myProduct = data;
        log('buy from refresh ${myProduct}');
      });
    });
  }

  bool search = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        children: [
          kHeight,
          // SearchBar(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              // autofocus: true,
              controller: searchController1,
              cursorColor: blue,
              style: TextStyle(color: blue),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: blue),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear, color: blue),
                  onPressed: () {
                    setState(() {
                      searchController1.clear();
                      searchList = myProduct;
                      log('controller2 ${searchController1.text}');
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
                  searchList = myProduct
                      .where((element) => element['name']
                          .toLowerCase()
                          .replaceAll(RegExp(r"\s+"), "")
                          .replaceAll(RegExp(r"[()]"), "")
                          .contains(value
                              .toLowerCase()
                              .replaceAll(RegExp(r"\s+"), "")))
                      .toList();
                });

                log(searchList.length.toString());
              },
            ),
          ),
          kHeight20,
          search
              ? Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 1,
                    itemBuilder: (context, index) => ProductCard(search: true),
                  ),
                )
              : Expanded(
                  child: StreamBuilder(
                      stream: getProducts(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                              child: CircularProgressIndicator(color: blue));
                        }
                        if (snapshot.connectionState == ConnectionState.done ||
                            snapshot.connectionState ==
                                ConnectionState.active) {
                          if (snapshot.hasData) {
                            final data = snapshot.data;
                            myProduct = data;
                            return snapshot.data!.isEmpty
                                ? const Center(child: Text('List empty'))
                                : RefreshIndicator(
                                    onRefresh: _refresh,
                                    child: ListView.builder(
                                      itemCount: data.length,
                                      shrinkWrap: true,
                                      physics: const BouncingScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        final product = data[index];
                                        return ProductTile(product: product);
                                      },
                                    ),
                                  );
                          }
                        }
                        return const Text("Cant fetch Data");
                      }),
                )
        ],
      ),
      bottomNavigationBar: navigateBtn(
        title: 'Add Product',
        context: context,
        navigateTo: const AddProductScreen(),
      ),
    );
  }
}
