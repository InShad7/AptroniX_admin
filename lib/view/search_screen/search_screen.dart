import 'dart:developer';

import 'package:aptronixadmin/controller/controller.dart';
import 'package:aptronixadmin/utils/color.dart';
import 'package:aptronixadmin/view/home_screen/production/product_list.dart';
import 'package:aptronixadmin/view/search_screen/widget/product_card.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
                        searchList = myProduct;
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
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: 1,
                itemBuilder: (context, index) => ProductCard(search: true),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
